# dkdeploy documentation

![Travis CI Build Status](https://travis-ci.org/dkdeploy/dkdeploy.github.io.svg?branch=develop)

This repository contains the documentation for dkdeploy. It is powered by [Jekyll](https://jekyllrb.com) 3.1.

## How to build it locally

### Technical Requirements

* OS X or Linux
* Ruby >= 2.2

### Installation

1. Clone this repository
2. Go inside the repository
3. Run `bundle install`
4. Run `bundle exec jekyll build`, the documentation will created within the `_site` folder

Have a look at the [Jekyll documentation](https://jekyllrb.com/docs/usage/) for the numerous ways to build the documentation.

## Contributing

1. Install [git flow](https://github.com/nvie/gitflow)
2. Install [Homebrew](http://brew.sh/) 
3. Install [NodeJS](https://nodejs.org) (supported: v0.12.7) via `brew install nodejs`
4. Install [Bower](http://bower.io) (supported: v1.7.9) via `npm install -g bower@1.7.9`
5. If project is not checked out already do `git clone git@github.com:dkdeploy/dkdeploy.github.io.git`
6. Checkout origin develop branch (`git checkout --track -b develop origin/develop`)
7. Git flow initialze `git flow init -d`
8. Create new feature branch (`git flow feature start my-new-feature`)
9. Commit your changes (`git commit -am 'Add some feature'`)

## User Interface: Bower & npm Setup

1. Go into the `foundation` directory
2. Run `npm install`
3. Run `bower install`
4. Run `npm start` to watch changes within the `scss` folder.