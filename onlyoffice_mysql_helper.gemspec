# frozen_string_literal: true

require_relative 'lib/onlyoffice_mysql_helper/name'
require_relative 'lib/onlyoffice_mysql_helper/version'

Gem::Specification.new do |s|
  s.name = OnlyofficeMysqlHelper::NAME
  s.version = OnlyofficeMysqlHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.email = %w[shockwavenn@gmail.com]
  s.summary = 'Simple MySQL wrapper'
  s.description = 'Simple MySQL wrapper. Used in QA of ONLYOFFICE'
  s.homepage = "https://github.com/ONLYOFFICE-QA/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
  s.add_runtime_dependency('mysql2', '~> 0')
  s.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')
end
