# frozen_string_literal: true

require 'bigdecimal'
require 'mysql2'
module OnlyofficeMysqlHelper
  # Class for using mysql
  class MySQLHelper
    # @return [String] database name
    attr_accessor :database

    # @return [String] default sql address
    SQL_SERVER_ADDRESS_LOCAL = '127.0.0.1'
    # @return [String] default sql user
    SQL_SERVER_USER_LOCAL = 'root'
    # @return [String] default sql password
    SQL_SERVER_PASSWORD_LOCAL = ''

    def initialize(address: SQL_SERVER_ADDRESS_LOCAL,
                   database: 'performance_test',
                   user: SQL_SERVER_USER_LOCAL,
                   password: SQL_SERVER_PASSWORD_LOCAL)
      port = ENV.fetch('DB_PORT', 3306)
      @connection = Mysql2::Client.new(host: address,
                                       port: port,
                                       username: user,
                                       password: password,
                                       database: database)
      @database = database
    end

    # Add hash record to table
    # @param [String] table_name to add hash
    # @param [Hash] hash to add
    # @return [nil]
    def add_record(table_name, hash)
      send_query do
        "INSERT INTO `#{table_name}` (`id`, #{from_query_keys(hash)}) " \
          "VALUES (NULL,#{from_query_values(hash)});"
      end
    end

    # Create specific table if not exists
    # @param [String] name of table
    # @param [String] columns of table
    # @return [nil]
    def create_table(name, columns = 'id INT PRIMARY KEY AUTO_INCREMENT')
      send_query { "CREATE TABLE IF NOT EXISTS `#{name}`(#{columns});" }
    end

    # Select table records
    # @param [String] table_name of table
    # @param [String] condition to filter
    # @return [Object] result of select
    def select_records(table_name, condition = '')
      send_query do
        query = "SELECT * FROM `#{table_name}`"
        query += " #{condition}" unless condition == ''
        "#{query};"
      end
    end

    # List all tables in base
    # @return [Object] table list
    def tables
      send_query { 'SHOW TABLES;' }
    end

    # Delete record by condition
    # @param [String] table_name of table
    # @param [String] condition to delete
    # @return [nil]
    def delete_record(table_name, condition)
      send_query { "DELETE FROM `#{table_name}` WHERE #{condition};" }
    end

    # Drop whole table
    # @param [String] table_name of table
    # @return [nil]
    def drop_table(table_name)
      send_query { "DROP TABLE `#{table_name}`;" }
    end

    private

    def send_query
      yield
      OnlyofficeLoggerHelper.log("Query: #{yield}")
      @connection.query(yield)
    end

    def from_query_keys(hash)
      query_keys = ''
      hash.each_key do |key_value|
        query_keys += "`#{key_value}`,"
      end
      query_keys.chop!
    end

    def from_query_values(hash)
      query_values = ''
      hash.each_value do |value|
        query_values += "'#{value.to_s.delete("'")}',"
      end
      query_values.chop!
    end
  end
end
