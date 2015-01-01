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

    sql_string = "SELECT *
                  FROM #{table_name}
                  WHERE #{where_string.join(" AND ")}"

    results = DBConnection.execute(sql_string, *values)
    parse_all(results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable

end
