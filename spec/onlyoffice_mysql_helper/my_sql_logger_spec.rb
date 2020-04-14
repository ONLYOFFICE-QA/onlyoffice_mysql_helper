# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeMysqlHelper::MySQLLogger do
  let(:logger) { described_class.new(mysql, log_table) }
  let(:random_int) { rand }
  let(:log_result) { mysql.select_records(log_table) }

  before do
    logger.create_log_table(log_table, test_column)
    logger.log_actions('Logging random int',
                       test_column.to_sym => random_int) do
      puts('Doing stuff...')
    end
  end

  after do
    mysql.drop_table(log_table)
  end

  it 'check if logging save two records' do
    expect(log_result.count).to eq(2)
  end

  it 'check if logging save custom column' do
    expect(log_result.first[test_column]).to eq(random_int.to_s)
  end

  it 'check if first record is with start info' do
    expect(log_result.first['operation']).to include('Start: ')
  end
end
