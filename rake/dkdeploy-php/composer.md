---
title: "namespace composer:local"
description: "This is about composer"
section: "rake"
layout: default
---
Composer manage PHP dependencies within your project. It requires a valid composer.json file.

**Requirements** <br/>
In order to use composer you need to
[install the composer software ](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx) as described on the website.

## Global configuration

Run `composer.phar help install` to see the list of available composer arguments.<br/>
It's recommended to use `--no-interaction` during the automatic deployment process.

{% highlight ruby %}
set :composer_default_arguments, ['--no-interaction']
set :composer_install_arguments, []
{% endhighlight %}


**Hint**<br/>
If your `composer.phar` is not located in the project directory you can change the path to your composer installation directly
in the `deploy.rb`.
{% highlight ruby %}
SSHKit.config.command_map[:composer] = 'vendor/composer.phar'
{% endhighlight %}



## check\_status

Checks current status of installed and ready to update packages.

### Usage

{% highlight shell %}
cap {{site.data.constants.deploy.stage}} composer:local:check_status
{% endhighlight %}

### Output

{% highlight shell %}
DEBUG [44f9a0bd] Running vendor/composer.phar install --dry-run --no-interaction --working-dir=htdocs/ 2>&1 as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG [44f9a0bd] Command: vendor/composer.phar install --dry-run --no-interaction --working-dir=htdocs/ 2>&1
DEBUG [44f9a0bd]     Loading composer repositories with package information
DEBUG [44f9a0bd]     Installing dependencies (including require-dev) from lock file
DEBUG [44f9a0bd]     Nothing to install or update
DEBUG [44f9a0bd] Finished in 0.372 seconds with exit status 0 (successful).
INFO Setting verbosity level to: 0 (from: 0)
INFO Running composer...
INFO [567f6db1] Running vendor/composer.phar status --no-interaction --working-dir=htdocs/ 2>&1 as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG [567f6db1] Command: vendor/composer.phar status --no-interaction --working-dir=htdocs/ 2>&1
DEBUG [567f6db1]     No local changes
INFO [567f6db1] Finished in 2.241 seconds with exit status 0 (successful).
INFO Reset verbosity level to: 0 (from: 0)
{% endhighlight %}

## run

With this command you can basically run every composer command.

### Usage

#### List all commands

{% highlight shell %}
cap {{site.data.constants.deploy.stage}} composer:local:run
{% endhighlight %}

### Output

{% highlight shell-session %}
Running vendor/composer.phar list --no-interaction -d=htdocs/ as dkdeploy@localhost
Command: (TERM=screen-256color vendor/composer.phar list --no-interaction -d=htdocs/)
Warning: This development build of composer is over 30 days old. It is recommended to
update it by running "vendor/composer.phar self-update" to get the latest version.
    ______
   / ____/___  ____ ___  ____  ____  ________  _____
  / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/
 / /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /
 \____/\____/_/ /_/ /_/ .___/\____/____/\___/_/
                     /_/
 Composer version 67a016878ee2c576573a55b03b44a6fc3f3ba003 2014-07-23 10:20:18

 Usage:
   [options] command [arguments]

Options:
  --help           -h Display this help message.
  --quiet          -q Do not output any message.
  --verbose        -v|vv|vvv Increase the verbosity of messages: 1 for normal output,
                    2 for more verbose output and 3 for debug
  --version        -V Display this application version.
  --ansi              Force ANSI output.
  --no-ansi           Disable ANSI output.
  --no-interaction -n Do not ask any interactive question.
  --profile           Display timing and memory usage information
  --working-dir    -d If specified, use the given directory as working directory.

Available commands:
  about            Short information about Composer
  archive          Create an archive of this composer package
  browse           Opens the package's repository URL or homepage in your browser.
  clear-cache      Clears composer's internal package cache.
  clearcache       Clears composer's internal package cache.
  config           Set config options
  create-project   Create new project from a package into given directory.
  depends          Shows which packages depend on the given package
  diagnose         Diagnoses the system to identify common errors.
  dump-autoload    Dumps the autoloader
  dumpautoload     Dumps the autoloader
  global           Allows running commands in the global composer dir ($COMPOSER_HOME).
  help             Displays help for a command
  home             Opens the package's repository URL or homepage in your browser.
  init             Creates a basic composer.json file in current directory.
  install          Installs the project dependencies from the composer.lock file
                   if present, or falls back on the composer.json.
  licenses         Show information about licenses of dependencies
  list             Lists commands
  remove           Removes a package from the require or require-dev
  require          Adds required packages to your composer.json and installs them
  run-script       Run the scripts defined in composer.json.
  search           Search for packages
  self-update      Updates composer.phar to the latest version.
  selfupdate       Updates composer.phar to the latest version.
  show             Show information about packages
  status           Show a list of locally modified packages
  update           Updates your dependencies to the latest version according
                   to composer.json, and updates the composer.lock file.
  validate         Validates a composer.json
{% endhighlight %}

#### Run a specific command

Wrap your call in double-quotes in order to pass an argument to the run task.

{% highlight shell %}
cap {{site.data.constants.deploy.stage}} composer:local:run[diagnose]
{% endhighlight %}

## validate

This will check if your composer file is valid.

### Usage

{% highlight shell %}
cap {{site.data.constants.deploy.stage}} composer:local:validate
{% endhighlight %}

### Output

{% highlight shell-session %}
Running vendor/composer.phar validate --no-interaction -d=htdocs/ as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
Command: ( TERM=screen-256color vendor/composer.phar validate --no-interaction -d=htdocs/ )
Warning: This development build of composer is over 30 days old. It is recommended to update
it by running "vendor/composer.phar self-update" to get the latest version.
./composer.json is valid, but with a few warnings
See http://getcomposer.org/doc/04-schema.md for details on the schema
No license specified, it is recommended to do so. For closed-source software you may use
"proprietary" as license.
require.dkd/downloaders : unbound version constraints (dev-master) should be avoided
Finished in 0.461 seconds with exit status 0 (successful).
{% endhighlight %}
