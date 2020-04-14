# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

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

def mysql
  @mysql ||= OnlyofficeMysqlHelper::MySQLHelper.new(database: 'test_by_spec')
end

def table_to_drop
  'Tables_in_test_by_spec'
end

def create_table_command
  'id INT PRIMARY KEY AUTO_INCREMENT, '\
  "#{test_column} VARCHAR(25) NOT NULL"
end

def test_table
  'test'
end

def test_column
  'test_data'
end

def get_records(table, column)
  mysql.select_records(table)
       .map { |row| row[column] }
end

# @return [String] name of table for log
def log_table
  'log_table'
end
