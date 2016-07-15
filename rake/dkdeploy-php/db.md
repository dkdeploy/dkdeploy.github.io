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
	TODO
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
	TODO
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
    TODO
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

{% highlight shell %}
$ cap dev db:migrations:execute_down
{% endhighlight %}

### Output

{% highlight shell %}
    TODO
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
