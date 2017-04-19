---
title: "namespace db:migrations"
description: "This is about Doctrine2 Database Migrations"
section: "rake"
layout: default
---

## generate

Generate and download new migrations

### Configuration

{% highlight ruby %}
set :migrations_default_arguments, ['--no-interaction']
{% endhighlight %}

### Usage

{% highlight shell %}
$ cap dev db:migrations:generate
{% endhighlight %}

### Output

{% highlight shell %}
$ cap dev db:migrations:generate
 00:00 db:migrations:copy_doctrine_to_server
       ./vendor/doctrine-migrations.phar found.
       Removing old migrations.
       01 rm -rf /var/www/dkdeploy/shared/migrations
     ✔ 01 vagrant@dkdeploy-php.dev 0.593s
       Creating directories for migrations.
       02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
     ✔ 02 vagrant@dkdeploy-php.dev 0.361s
       Copying doctrine-migrations.phar to /var/www/dkdeploy/shared/migrations directory.
       Uploading ./vendor/doctrine-migrations.phar 10.75%
       Uploading ./vendor/doctrine-migrations.phar 20.3%
       Uploading ./vendor/doctrine-migrations.phar 31.04%
       Uploading ./vendor/doctrine-migrations.phar 40.6%
       Uploading ./vendor/doctrine-migrations.phar 50.15%
       Uploading ./vendor/doctrine-migrations.phar 60.9%
       Uploading ./vendor/doctrine-migrations.phar 70.45%
       Uploading ./vendor/doctrine-migrations.phar 81.19%
       Uploading ./vendor/doctrine-migrations.phar 90.75%
       Uploading ./vendor/doctrine-migrations.phar 100.0%
       Copying db-configuration.php to /var/www/dkdeploy/shared/migrations.
       Downloading db_settings.dev.yaml 100.0%
       Uploading /var/www/dkdeploy/shared/migrations/cli-config.php 100.0%
       Uploading /var/www/dkdeploy/shared/migrations/migrations.yml 100.0%
 00:01 db:migrations:generate
       Generating new migration.
       01 mkdir -p /var/www/dkdeploy/shared/migrations
     ✔ 01 vagrant@dkdeploy-php.dev 0.008s
       02 /usr/bin/php doctrine-migrations.phar migrations:generate --no-interaction
       02 Generated new migration class to "/var/www/dkdeploy/shared/migrations/classes/Version20170419091311.php"
     ✔ 02 vagrant@dkdeploy-php.dev 0.055s
       Downloading config/migrations/classes/Version20170419091311.php 100.0%
{% endhighlight %}

### Additional information

This task will first call <a href="#copydoctrinetoserver">copy doctrine to server</a>, so any configuration options in that task will also affect this one. 

## status

Show migration status

### Usage

{% highlight shell %}
$ cap dev db:migrations:status
{% endhighlight %}

### Output

{% highlight shell %}
$  cap dev db:migrations:status
  00:00 db:migrations:copy_doctrine_to_server
        ./vendor/doctrine-migrations.phar found.
        Removing old migrations.
        01 rm -rf /var/www/dkdeploy/shared/migrations
      ✔ 01 vagrant@dkdeploy-php.dev 0.584s
        Creating directories for migrations.
        02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
      ✔ 02 vagrant@dkdeploy-php.dev 0.357s
        Copying doctrine-migrations.phar to /var/www/dkdeploy/shared/migrations directory.
        Uploading ./vendor/doctrine-migrations.phar 10.75%
        Uploading ./vendor/doctrine-migrations.phar 20.3%
        Uploading ./vendor/doctrine-migrations.phar 31.04%
        Uploading ./vendor/doctrine-migrations.phar 40.6%
        Uploading ./vendor/doctrine-migrations.phar 50.15%
        Uploading ./vendor/doctrine-migrations.phar 60.9%
        Uploading ./vendor/doctrine-migrations.phar 70.45%
        Uploading ./vendor/doctrine-migrations.phar 81.19%
        Uploading ./vendor/doctrine-migrations.phar 90.75%
        Uploading ./vendor/doctrine-migrations.phar 100.0%
        Copying db-configuration.php to /var/www/dkdeploy/shared/migrations.
        Downloading db_settings.dev.yaml 100.0%
        Uploading /var/www/dkdeploy/shared/migrations/cli-config.php 100.0%
        Uploading /var/www/dkdeploy/shared/migrations/migrations.yml 100.0%
  00:01 db:migrations:copy_migrations_to_server
        Uploading migrations to /var/www/dkdeploy/shared/migrations/classes.
        01 rm -rf /var/www/dkdeploy/shared/migrations/classes
      ✔ 01 vagrant@dkdeploy-php.dev 0.006s
  00:01 db:migrations:status
        Getting status of migrations.
        01 /usr/bin/php doctrine-migrations.phar migrations:status
        01 
        01  == Configuration
        01 
        01     >> Name:                                               Doctrine TYPO3 Migrations
        01     >> Database Driver:                                    pdo_mysql
        01     >> Database Name:                                      dkdeploy_php
        01     >> Configuration Source:                               /var/www/dkdeploy/shared/migrations/migrations.yml
        01     >> Version Table Name:                                 doctrine_migrations
        01     >> Migrations Namespace:                               DoctrineMigrations
        01     >> Migrations Directory:                               /var/www/dkdeploy/shared/migrations/classes
        01     >> Current Version:                                    0
        01     >> Latest Version:                                     0
        01     >> Executed Migrations:                                0
        01     >> Available Migrations:                               0
        01     >> New Migrations:                                     0
      ✔ 01 vagrant@dkdeploy-php.dev 0.051s
{% endhighlight %}

### Additional information

This task will first call <a href="#copydoctrinetoserver">copy migration to server</a> and <a href="#copymigrationtoserver">copy doctrine to server</a>, so any configuration options in that task will also affect this one. 

## migrate

Migrate database

### Configuration

{% highlight ruby %}
set :migrations_default_arguments, ['--no-interaction']
{% endhighlight %}

### Usage

{% highlight shell %}
$ cap dev db:migrations:migrate
{% endhighlight %}

### Output

{% highlight shell %}
$ cap dev db:migrations:migrate
00:00 db:migrations:copy_doctrine_to_server
      ./vendor/doctrine-migrations.phar found.
      Removing old migrations.
      01 rm -rf /var/www/dkdeploy/shared/migrations
    ✔ 01 vagrant@dkdeploy-php.dev 0.379s
      Creating directories for migrations.
      02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
    ✔ 02 vagrant@dkdeploy-php.dev 0.379s
      Copying doctrine-migrations.phar to /var/www/dkdeploy/shared/migrations directory.
      Uploading ./vendor/doctrine-migrations.phar 10.75%
      Uploading ./vendor/doctrine-migrations.phar 20.3%
      Uploading ./vendor/doctrine-migrations.phar 31.04%
      Uploading ./vendor/doctrine-migrations.phar 40.6%
      Uploading ./vendor/doctrine-migrations.phar 50.15%
      Uploading ./vendor/doctrine-migrations.phar 60.9%
      Uploading ./vendor/doctrine-migrations.phar 70.45%
      Uploading ./vendor/doctrine-migrations.phar 81.19%
      Uploading ./vendor/doctrine-migrations.phar 90.75%
      Uploading ./vendor/doctrine-migrations.phar 100.0%
      Copying db-configuration.php to /var/www/dkdeploy/shared/migrations.
      Downloading db_settings.dev.yaml 100.0%
      Uploading /var/www/dkdeploy/shared/migrations/cli-config.php 100.0%
      Uploading /var/www/dkdeploy/shared/migrations/migrations.yml 100.0%
00:01 db:migrations:copy_migrations_to_server
      Uploading migrations to /var/www/dkdeploy/shared/migrations/classes.
      01 rm -rf /var/www/dkdeploy/shared/migrations/classes
    ✔ 01 vagrant@dkdeploy-php.dev 0.008s
      Uploading migrations for stage dev to /var/www/dkdeploy/shared/migrations/classes.
      02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
    ✔ 02 vagrant@dkdeploy-php.dev 0.005s
      Uploading config/migrations/stage/dev/Version22222222222222.php 100.0%
      Uploading config/migrations/stage/dev/Version33333333333333.php 100.0%
00:01 db:migrations:migrate
      Migrating database.
      01 /usr/bin/php doctrine-migrations.phar migrations:migrate --no-interaction
      01                                                                  
      01                     Doctrine TYPO3 Migrations                    
      01                                                                  
      01 
      01 Migrating up to 33333333333333 from 0
      01 
      01   ++ migrating 22222222222222
      01 
      01 Migration 22222222222222 was executed but did not result in any SQL statements.
      01 
      01   ++ migrated (0s)
      01 
      01   ++ migrating 33333333333333
      01 
      01 Migration 33333333333333 was executed but did not result in any SQL statements.
      01 
      01   ++ migrated (0s)
      01 
      01   ------------------------
      01 
      01   ++ finished in 0
      01   ++ 2 migrations executed
      01   ++ 0 sql queries
    ✔ 01 vagrant@dkdeploy-php.dev 0.064s

{% endhighlight %}

### Additional information

This task will first call <a href="#copydoctrinetoserver">copy migration to server</a> and <a href="#copymigrationtoserver">copy doctrine to server</a>, so any configuration options in that task will also affect this one. 


## execute\_down

Downgrade database to a previous version
<div class="callout alert">
CAUTION: It may not be possible to downgrade cleanly. If e.g. a previous migration concatenated fields in a table, it will not be possible any longer to separate the information.
</div>

### Configuration

{% highlight ruby %}
set :migrations_default_arguments, ['--no-interaction']
{% endhighlight %}


### Usage

Pass the targeting `migration_version` either as an argument (example in output section) or enter it interactively.

{% highlight shell %}
$ cap dev db:migrations:execute_down
{% endhighlight %}


### Output

{% highlight shell %}
$ cap dev db:migrations:execute_down[33333333333333]
00:00 db:migrations:copy_doctrine_to_server
      ./vendor/doctrine-migrations.phar found.
      Removing old migrations.
      01 rm -rf /var/www/dkdeploy/shared/migrations
    ✔ 01 vagrant@dkdeploy-php.dev 0.381s
      Creating directories for migrations.
      02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
    ✔ 02 vagrant@dkdeploy-php.dev 0.364s
      Copying doctrine-migrations.phar to /var/www/dkdeploy/shared/migrations directory.
      Uploading ./vendor/doctrine-migrations.phar 10.75%
      Uploading ./vendor/doctrine-migrations.phar 20.3%
      Uploading ./vendor/doctrine-migrations.phar 31.04%
      Uploading ./vendor/doctrine-migrations.phar 40.6%
      Uploading ./vendor/doctrine-migrations.phar 50.15%
      Uploading ./vendor/doctrine-migrations.phar 60.9%
      Uploading ./vendor/doctrine-migrations.phar 70.45%
      Uploading ./vendor/doctrine-migrations.phar 81.19%
      Uploading ./vendor/doctrine-migrations.phar 90.75%
      Uploading ./vendor/doctrine-migrations.phar 100.0%
      Copying db-configuration.php to /var/www/dkdeploy/shared/migrations.
      Downloading db_settings.dev.yaml 100.0%
      Uploading /var/www/dkdeploy/shared/migrations/cli-config.php 100.0%
      Uploading /var/www/dkdeploy/shared/migrations/migrations.yml 100.0%
00:00 db:migrations:copy_migrations_to_server
      Uploading migrations to /var/www/dkdeploy/shared/migrations/classes.
      01 rm -rf /var/www/dkdeploy/shared/migrations/classes
    ✔ 01 vagrant@dkdeploy-php.dev 0.006s
      Uploading migrations for stage dev to /var/www/dkdeploy/shared/migrations/classes.
      02 mkdir -p /var/www/dkdeploy/shared/migrations/classes
    ✔ 02 vagrant@dkdeploy-php.dev 0.006s
      Uploading config/migrations/stage/dev/Version22222222222222.php 100.0%
      Uploading config/migrations/stage/dev/Version33333333333333.php 100.0%
      Uploading config/migrations/stage/dev/Version44444444444444.php 100.0%
      Migrating down to version 33333333333333
      03 /usr/bin/php doctrine-migrations.phar migrations:execute 33333333333333 --down --no-interaction
      03 
      03   -- reverting 33333333333333
      03 
      03 Migration 33333333333333 was executed but did not result in any SQL statements.
      03 
      03   -- reverted (0.01s)
    ✔ 03 vagrant@dkdeploy-php.dev 0.062s

{% endhighlight %}

## copy\_doctrine\_to\_server

Sets up Doctrine on the server

### Configuration

{% highlight ruby %}
set :remote_migrations_root_directory, 'migrations'
set :doctrine_phar, './vendor/doctrine-migrations.phar'
{% endhighlight %}

### Usage

{% highlight shell %}
$ cap dev db:migrations:copy_doctrine_to_server
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 db:migrations:copy_doctrine_to_server
      ./vendor/doctrine-migrations.phar found.
      Removing old migrations.
      01 rm -rf {{site.data.constants.deploy.shared_path}}migrations
{{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}'s password:
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 2.482s
      Creating directories for migrations.
      02 mkdir -p {{site.data.constants.deploy.shared_path}}shared/migrations/classes
    ✔ 02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.004s
      Copying doctrine-migrations.phar to {{site.data.constants.deploy.shared_path}}shared/migrations directory.
      Uploading ./vendor/doctrine-migrations.phar 11.09%
      Uploading ./vendor/doctrine-migrations.phar 20.95%
      Uploading ./vendor/doctrine-migrations.phar 30.82%
      Uploading ./vendor/doctrine-migrations.phar 40.68%
      Uploading ./vendor/doctrine-migrations.phar 50.54%
      Uploading ./vendor/doctrine-migrations.phar 60.4%
      Uploading ./vendor/doctrine-migrations.phar 70.26%
      Uploading ./vendor/doctrine-migrations.phar 80.12%
      Uploading ./vendor/doctrine-migrations.phar 91.22%
      Uploading ./vendor/doctrine-migrations.phar 100.0%
      Copying db-configuration.php to {{site.data.constants.deploy.shared_path}}shared/migrations.
      Uploading {{site.data.constants.deploy.shared_path}}shared/migrations/cli-config.php 100.0%
      Uploading {{site.data.constants.deploy.shared_path}}/migrations/migrations.yml 100.0%
{% endhighlight %}

### Additional information

To always work with a clean status, this task will delete all existing migrations and rewrite them. Any manual database changes, that were not done via Doctrine, are lost.

## copy\_migrations\_to\_server

Copies your Doctrine migrations to the server

### Usage

{% highlight shell %}
	$ cap dev db:migrations:copy_migrations_to_server
{% endhighlight %}

### Output

{% highlight shell-session %}
db:migrations:copy_migrations_to_server
Uploading migrations to {{site.data.constants.deploy.path}}shared/migrations/classes.
01 rm -rf {{site.data.constants.deploy.path}}shared/migrations/classes
01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.397s
Uploading config/migrations/classes/Version20150209140000.php 100.0%
Uploading config/migrations/classes/upgrade-6_2-to-7_6/Version20151119123523.php 100.0%
Uploading migrations for stage {{site.data.constants.deploy.stage}} to {{site.data.constants.deploy.path}}shared/migrations/classes.
02 mkdir -p {{site.data.constants.deploy.path}}shared/migrations/classes
02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.008s
Uploading config/migrations/stage/{{site.data.constants.deploy.stage}}Version20120109171451.php 100.0%
{% endhighlight %}
