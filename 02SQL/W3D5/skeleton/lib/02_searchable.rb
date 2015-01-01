require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_string = []
    values = []
    params.each do |key, value|
      where_string << "#{key} = ?"
      values << value
    end

    sql_string =

    DBConnection.execute(sql_string, *values[1..-1])
  end
end

class SQLObject
  # Mixin Searchable here...
end
