# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'onlyoffice_mysql_helper'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# @return [OnlyofficeMysqlHelper::MySQLHelper] default object
def mysql
  @mysql ||= OnlyofficeMysqlHelper::MySQLHelper.new(database: 'test_by_spec')
end

# @return [String] table to test drop
def table_to_drop
  'Tables_in_test_by_spec'
end

# @return [String] command to test table creation
def create_table_command
  'id INT PRIMARY KEY AUTO_INCREMENT, '\
    "#{test_column} VARCHAR(25) NOT NULL"
end

# @return [String] name of test table
def test_table
  'test'
end

# @return [String] name of test column
def test_column
  'test_data'
end

# @return [Array<Object>] get column records from table
def get_records(table, column)
  mysql.select_records(table)
       .map { |row| row[column] }
end

# @return [String] name of table for log
def log_table
  'log_table'
end
