# Change log

## master (unreleased)

### New Features

* Check 100% code coverage in CI
* Add `ruby-3.0` to CI

### Changes

* Remove `codecov` dependency

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
