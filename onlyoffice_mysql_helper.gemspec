lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onlyoffice_mysql_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'onlyoffice_mysql_helper'
  spec.version       = OnlyofficeMysqlHelper::VERSION
  spec.authors       = ['ONLYOFFICE', 'Pavel Lobashov']
  spec.email         = %w[shockwavenn@gmail.com]

  spec.summary       = 'Simple MySQL wrapper'
  spec.description   = 'Simple MySQL wrapper. Used in QA of ONLYOFFICE'
  spec.homepage      = 'https://github.com/onlyoffice-testing-robot/onlyoffice_mysql_helper'

  spec.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  spec.require_paths = ['lib']
  spec.add_runtime_dependency('mysql2', '~> 0')
  spec.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')

  spec.license = 'AGPL-3.0'
end
