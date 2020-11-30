# frozen_string_literal: true

require_relative 'lib/onlyoffice_mysql_helper/name'
require_relative 'lib/onlyoffice_mysql_helper/version'

Gem::Specification.new do |s|
  s.name = OnlyofficeMysqlHelper::NAME
  s.version = OnlyofficeMysqlHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.5'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.email = %w[shockwavenn@gmail.com]
  s.summary = 'Simple MySQL wrapper'
  s.description = 'Simple MySQL wrapper. Used in QA of ONLYOFFICE'
  s.homepage = "https://github.com/onlyoffice-testing-robot/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
  s.add_runtime_dependency('mysql2', '~> 0')
  s.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')
  s.add_development_dependency('rake', '~> 13.0')
end
