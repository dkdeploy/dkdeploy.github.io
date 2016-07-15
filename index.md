---
layout: startpage
title: "dkdeploy - A Powerful Extension to Capistrano"
---

**dkdeploy** consists currently mainly of four Rubygems:

* dkdeploy-core
* dkdeploy-php
* dkdeploy-typo3-cms

In addition to those the following gems provide optional testing infrastructure:

* dkdeploy-cucumber
* dkdeploy-test

**dkdeploy-core** is the foundation for all dkdeploy gems. It extends Capistrano 3.4+ with the following features:

* Copy Strategy: Deploy directly from file system. Useful if you are into **Continous Deployment**.
* Bower Integration
* Upload databases
* Adjust file permissions
* Provide a maintenance page during deployment
* Upload/Download files

**dkdeploy-php** provides additional functionality for deployments targeting php applications:

* Composer integration
* Doctrine2 migrations
* Clear APC Cache / OPcache
* Show php version

**dkdeploy-typo3-cms** enables you to perform TYPO3-specific tasks:

* xxx
* xxx
* xxx

### Requirements

* Linux or Mac OS X
* Ruby 2.1.x or newer
* Rubygems and Bundler

### Installation

Add **dkdeploy-core** to your Gemfile:

    gem 'dkdeploy-core', '~> 5.0'

Run Bundler and generate Capistrano setup:

    $ bundle install
    $ bundle exec cap install

List all available Capistrano tasks:

    $ cap -T
