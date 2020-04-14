# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeMysqlHelper::MySQLHelper do
  record_string = nil

  let(:create_table) { mysql.create_table(test_table, create_table_command) }
  let(:add_record) { mysql.add_record(test_table, test_data: record_string) }

  before do
    mysql.tables.each { |table| mysql.drop_table(table[table_to_drop]) }
  end

  it 'create_table' do
    create_table
    expect(mysql.tables.map { |table| table[table_to_drop] }
                .include?(test_table))
      .to be true
  end

  it 'add_record' do
    record_string = Time.now.to_s
    create_table
    add_record
    expect(get_records(test_table, test_column)).to include(record_string)
  end

  it 'delete_record' do
    record_string = Time.now.to_s
    create_table
    add_record
    mysql.delete_record(test_table, "test_data = '#{record_string}'")
    expect(get_records(test_table, test_column)).not_to include(record_string)
  end
end
