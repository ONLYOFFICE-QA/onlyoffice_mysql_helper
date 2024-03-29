# frozen_string_literal: true

module OnlyofficeMysqlHelper
  # Log action in mysql
  class MySQLLogger
    # @return [MySQLHelper] instance of helper
    attr_accessor :mysql
    # @return [String] table name
    attr_accessor :table
    # @return [Hash] hash to add to DB
    attr_accessor :hash

    def initialize(mysql = MySQLHelper.new, table = nil, hash = {})
      @mysql = mysql
      @table = table
      @hash = hash
    end

    # Create table for logging purposes
    # @param table_name [String] name of table to create
    # @return [Void]
    def create_log_table(table_name, column)
      table_command = 'id INT PRIMARY KEY AUTO_INCREMENT, ' \
                      "#{column} VARCHAR(25) NOT NULL, " \
                      'time VARCHAR(255) NOT NULL, ' \
                      'operation VARCHAR(255) NOT NULL'
      @mysql.create_table(table_name, table_command)
    end

    # Log ant actions in DB
    # @param [String] action name for log
    # @param [Hash] hash with additional options
    # @return [nil]
    def log_actions(action, hash)
      mysql_hash = hash.merge(@hash)
      mysql_hash[:time] = Time.now
      mysql_hash[:operation] = "Start: #{action}"
      @mysql.add_record(@table, mysql_hash)

      yield

      mysql_hash[:time] = Time.now
      mysql_hash[:operation] = "Finished: #{action}"
      @mysql.add_record(@table, mysql_hash)
    end
  end
end
