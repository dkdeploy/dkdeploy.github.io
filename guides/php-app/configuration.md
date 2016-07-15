---
title: "Simple PHP Application: Configuration"
description: "Configuration"
section: "guides"
layout: default
---

We will create a small PHP Application that utilizes Composer.

## Requirements

* PHP 
* composer in your PATH

## Create a PHP sample application

Create a directory **sample_app/web**:

{% highlight shell-session %}
mkdir -p sample_app/web
{% endhighlight %}

The **web** folder will be the **document_root** of our application.

{% highlight shell-session %}
sample_app
└── web
{% endhighlight %}

Go into the **sample_app** directory:

{% highlight shell-session %}
cd sample_app
{% endhighlight %}

and run 

{% highlight shell-session %}
composer require fzaninotto/faker
{% endhighlight %}

This will download the faker library into a new directory vendor and also create valid composer files:

{% highlight shell-session %}
Using version ~1.6 for fzaninotto/faker
./composer.json has been created
Loading composer repositories with package information
Updating dependencies (including require-dev)
  - Installing fzaninotto/faker (v1.6.0)
    Loading from cache

Writing lock file
Generating autoload files
{% endhighlight %}

{% highlight shell-session %}
sample_app
├── composer.json
├── composer.lock
├── vendor
└── web
{% endhighlight %}

### The app

Create an **index.php** file within the **web** directory.

### Source index.php

{% highlight php %}
<html>
  <head>
    <title>Faker</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" media="all">
  </head>
  <body>
    <h1>Faker</h1>
    <table class="table table-striped">
      <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Text</th>
      </tr>
<?php
// require the Faker autoloader
require_once '../vendor/autoload.php';

for( $i = 0; $i < 10; $i++ ):
  echo '<tr>';
  // use the factory to create a Faker\Generator instance
  $faker = Faker\Factory::create();
  // generate data by accessing properties
  echo "<td>{$faker->name}</td>";
  echo "<td>{$faker->address}</td>";
  echo "<td>{$faker->text}</td>";
  echo '</tr>';
endfor;
?>
</table>
  </body>
</html>
{% endhighlight %}

## Setup Capistrano

Please follow the setup on the  [Initial Setup](/guides/index.html) page within your **sample_app** directory.

### Install dkdeploy-php via bundler

In order to make our deployment work we will use the **dkdeploy-php** gem. Our Gemfile should look like this:

{% highlight ruby %}
source "https://rubygems.org"
gem 'dkdeploy-php'
{% endhighlight %}

Now run **bundle install** to install the gem.

<div class="callout primary">
  By requiring the <b>dkdeploy-php</b> gem in your Gemfile you will automatically have all the functionality of the <b>dkdeploy-core</b> gem.
</div>

### Extend the Capfile

Make sure that you require the **PHP** tasks:

{% highlight ruby %}
# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Include dkdeploy gem
require 'dkdeploy'

# Includes dkdeploy deployment tasks
require 'capistrano/dkdeploy/core'

# Includes dkdeploy-php deployment tasks
require 'capistrano/dkdeploy/php'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
{% endhighlight %}

### Check if the dkdeploy tasks are available

Run **bundle exec cap -T**

You should now get a list of all available tasks. If you see the following composer tasks among them everything should be okay:

{% highlight shell-session %}
cap composer:local:check_status              # Check the status of the composer.json file
cap composer:local:run[command]              # Execute composer command
cap composer:local:validate                  # Validate composer file
{% endhighlight %}

### Configuring deploy.rb

Open the file **deploy.rb** in the **config** folder. 

* We give our application the name **faker-app**. Capistroano will deploy this to `/var/www/faker-app`
* We make sure that Composer is correctly set-up

{% highlight ruby %}
# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'faker-app'
set :scm,             :copy
set :copy_source,     './web'
set :copy_exclude, %w(
  vendor
  .hidden
  **/.hidden
)
# Check if Composer was invoked
after 'deploy:started', 'composer:local:check_status'
{% endhighlight %}

### Configuring  the dev stage
Lets say we just want to deploy the generated output to a Vagrant VM.

Open `deploy/dev.rb` and add the following settings:

{% highlight ruby %}
server '{{site.data.constants.deploy.host}}', user: '{{site.data.constants.deploy.user}}', roles: %w{web app}
set :deploy_to, "/var/www/#{fetch(:application)}"
set :keep_releases, 5
{% endhighlight %}

We fetch the **:application** variable we set in **deploy.rb**, so the application will deploy into **{{site.data.constants.deploy.vendor_root}}**.

We also set **:keep_releases** to 5. That ensures that Capistrano will keep the last 5 successful releases on the server.

<div class="callout primary">
You might want to have a look at the <b> <a href="/rake/dkdeploy-php/composer.html">Composer section</a></b> for additional configuration options.
</div>

<a class="button hollow float-right" href="/guides/php-app/deployment.html">Next Page: Deployment</a>
