require 'mysql2'
module OnlyofficeMysqlHelper
  # Class for using mysql
  class MySQLHelper
    attr_accessor :mysql
    attr_accessor :database
    SQL_SERVER_ADDRESS_LOCAL = '127.0.0.1'.freeze
    SQL_SERVER_USER_LOCAL = 'root'.freeze
    SQL_SERVER_PASSWORD_LOCAL = ''.freeze

    def initialize(address: SQL_SERVER_ADDRESS_LOCAL, database: 'performance_test',
                   user: SQL_SERVER_USER_LOCAL, password: SQL_SERVER_PASSWORD_LOCAL)
      @connection = Mysql2::Client.new(host: address, username: user, password: password, database: database)
      @database = database
    end

    def add_record(table_name, hash)
      send_query do
        query_insert_into = "INSERT INTO `#{table_name}` (`id`, "
        query_keys = ''
        hash.keys.each do |key_value|
          query_keys += "`#{key_value}`,"
        end
        query_keys.chop!
        query_into_values = ') VALUES (NULL,'
        query_values = ''
        hash.values.each do |value|
          query_values += "'#{value.to_s.delete("'")}',"
        end
        query_values.chop!
        query_end = ');'
        query_insert_into + query_keys + query_into_values + query_values + query_end
      end
    end

    def create_table(name, columns = 'id INT PRIMARY KEY AUTO_INCREMENT')
      send_query { "CREATE TABLE IF NOT EXISTS `#{name}`(#{columns});" }
    end

    def select_records(table_name, condition = '')
      send_query do
        query = "SELECT * FROM `#{table_name}`"
        query += " #{condition}" unless condition == ''
        query + ';'
      end
    end

    def get_tables
      send_query { 'SHOW TABLES;' }
    end

    def delete_record(table_name, condition)
      send_query { "DELETE FROM `#{table_name}` WHERE #{condition};" }
    end

    def drop_table(table_name)
      send_query { "DROP TABLE `#{table_name}`;" }
    end

    private

    def send_query
      yield
      OnlyofficeLoggerHelper.log("Query: #{yield}")
      @connection.query(yield)
    end
  end
end
