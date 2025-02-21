# Change log

## master (unreleased)

### New Features

* Add `ruby-3.1`, `ruby-3.2` in CI
* Add `ruby-3.3` to CI
* Add `ruby-3.4` to CI
* Add `yamllint` check in CI
* Add `dependabot` check for `GitHub Actions`

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI
* Run `rubocop` in CI through `bundle exec`

### Changes

* Remove `ruby-2.5` from CI since it's EOLed
* Check `dependabot` at 8:00 Moscow time daily
* Changes from `rubocop-rspec` update to 2.9.0
* Fix `rubocop-1.28.1` code issues
* Drop `ruby-2.6`, `ruby-2.7` support, since it's EOL'ed
* Use `mysql:8` as docker base for CI
* Fix `rubocop-1.65.0` cop `Gemspec/AddRuntimeDependency`
* Add `bigdecimal` dependency, to be compatible with `ruby-3.4`
* Remove `ruby-3.0` from CI, since it's EOLed

## 0.3.0 (2021-15-11)

### New Features

* Check 100% code coverage in CI
* Add `ruby-3.0` to CI

### Changes

* Remove `codecov` dependency
* Require `mfa` for releasing gem

## 0.2.0 (2020-12-03)

### New Features

* Add ability to set port via ENV `DB_PORT`
* Add `rubocop` check in CI
* Add `rubocop-rake` support
* Add `dependabot` config
* Add CI check that code is 100% documented

### Fixes

* Add missing `markdownlint` config
* Fix `rake release_github_rubygems` task to use `sh` calls

### Changes

* Use GitHub Actions instead of TravisCI
* Drop support of rubies earlier, than 2.5
* Freeze dependencies versions in `Gemfile.lock`
* Fixes from update `rubocop` to 1.4.2
* Add all missing documentation
* Moved repo to `ONLYOFFICE-QA` org

## 0.1.0 (2020-04-14)

### New Features

* Add `MySQLLogger` class
* Add rake task for releasing gem on github

### Changes

* Rename `get_tables` to `tables`
* Cleanup gemspec
* Remove unneeded `/bin` files

### Fixes

* Fix calculating coverage if running locally
* Cleanup README file
