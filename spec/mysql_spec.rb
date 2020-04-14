# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'mysql' do
  mysql = OnlyofficeMysqlHelper::MySQLHelper.new(database: 'test_by_spec')
  table_name = 'test'
  column_name = 'test_data'
  record_string = nil

  let(:create_table) { mysql.create_table(table_name, 'id INT PRIMARY KEY AUTO_INCREMENT, test_data VARCHAR(25) NOT NULL') }
  let(:add_record) { mysql.add_record(table_name, test_data: record_string) }

  before do
    mysql.get_tables.each { |table| mysql.drop_table(table['Tables_in_test_by_spec']) }
  end

  it 'create_table' do
    create_table
    expect(mysql.get_tables.map { |table| table['Tables_in_test_by_spec'] }.include?(table_name)).to be true
  end

  it 'add_record' do
    record_string = Time.now.to_s
    create_table
    add_record
    expect(mysql.select_records(table_name).map { |row| row[column_name] }).to include(record_string)
  end

  it 'delete_record' do
    record_string = Time.now.to_s
    create_table
    add_record
    mysql.delete_record(table_name, "test_data = '#{record_string}'")
    expect(mysql.select_records(table_name).map { |row| row[column_name] }).to_not include(record_string)
  end
end
