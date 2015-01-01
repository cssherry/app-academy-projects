require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    all_columns_and_values = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL

    all_columns_and_values.first.collect(&:to_sym)
  end

  #Needs to be called at the end of subclass definition
  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}") { attributes[column] }
      define_method("#{column}=") { |value| attributes[column] = value}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name.tableize
  end

  def self.table_name
    @table_name = @table_name || self.to_s.tableize
  end

  def self.all
    #apparently can only use ? to interpolate values, not column names or tables?
    results = DBConnection.execute(<<-SQL)
      SELECT #{table_name}.*
      FROM #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.collect do |row|
      self.new(row)
      # row.each do |key, value|
      #   new_object.send("#{key}=", value)
      # end
      # new_object need to return new_object so it's collected
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{table_name}
      WHERE id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    attribute_list = self.class.columns
    params.each do |param, value|
      param = param.to_sym
      fail "unknown attribute '#{param}'" unless attribute_list.include?(param)
      send("#{param}=", value)
    end
  end

  #Needed for finalize! method
  def attributes
    @attributes = @attributes || {}
  end

  def attribute_values
    self.class.columns.collect{|value| send(value)}
  end

  def insert
    columns_to_add = self.class.columns.map(&:to_s)[1..-1].join(", ")
    question_marks_array = ["?"] * (self.class.columns.length - 1)
    question_marks = question_marks_array.join(", ")
    column_values = attribute_values[1..-1]

    sql_script = "INSERT INTO
                  #{self.class.table_name} (#{columns_to_add})
                  VALUES
                  (#{question_marks})"

    DBConnection.execute(sql_script, *column_values)
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns_to_update_array = self.class.columns[1..-1].map{|column| "#{column} = ?"}
    columns_to_update = columns_to_update_array.join(", ")
    column_values = attribute_values[1..-1]
    sql_script = "UPDATE
                    #{self.class.table_name}
                  SET
                    #{columns_to_update}
                  WHERE
                    id = #{id}"
    DBConnection.execute(sql_script, *column_values)
  end

  def save
    id.nil? ? insert : update
  end
end
