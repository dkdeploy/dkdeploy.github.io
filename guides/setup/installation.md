---
title: "Setup: Installing dkdeploy"
description: "TODO"
section: guides
layout: "default"
---

## Installation

Create a folder or go into your existing project folder and run

<div class="callout warning">
  Make sure that you  run the following commands <b>outside</b> your application's directory to avoid naming conflicts if you're planning to deploy a non-Ruby application.
</div>

{% highlight shell %}
$ bundle init
{% endhighlight %}
This will create an empty **Gemfile**. Open the file in an editor and add the source of the corresponding gem server and the **dkdeploy-core** gem:

{% highlight ruby %}
source 'https://rubygems.org'
gem 'dkdeploy-core', '~> 8.0.0'
{% endhighlight ruby %}

Now run bundler:

{% highlight shell %}
$ bundle
{% endhighlight %}

You should see bundler resolving dependencies and installing the required gems:

{% highlight shell %}
Fetching gem metadata from https://rubygems.dkd.de/........
Resolving dependencies...
Using rake 10.4.2
Using capistrano-stats 1.1.1
Using i18n 0.7.0
Using colorize 0.7.5
Using net-ssh 2.9.2
Using net-scp 1.2.1
Installing sshkit 1.7.1
Using capistrano 3.3.5
Using deep_merge 1.0.1
Using highline 1.6.21
Installing dkdeploy-core 4.0.1
Using bundler 1.7.12
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
{% endhighlight %}

## Initialize Capistrano

Run in your project root

{% highlight shell %}
$ bundle exec cap install STAGES='dev,integration,testing,production'
{% endhighlight %}

This command will create the following Capistrano file structure with all the standard pre-configured constants.
Please be aware of the difference to the [native installation](http://capistranorb.com/documentation/getting-started/preparing-your-application/) of Capistrano.
Certainly you have to adjust `config/deploy.rb` and respective stages and customize them for your needs.

{% highlight shell %}
    .
    |-- Capfile
    |-- Gemfile
    |-- Gemfile.lock
    |-- config
    |   |-- deploy
    |   |   |-- dev.rb
    |   |   |-- integration.rb
    |   |   |-- production.rb
    |   |   `-- testing.rb
    |   `-- deploy.rb
    `-- lib
        `-- capistrano
            `-- tasks

{% endhighlight %}

Before we continue, we have to alter the ```Capfile``` in your root directory:

{% highlight ruby %}
# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Include dkdeploy gem
require 'dkdeploy'

# Includes dkdeploy deployment tasks
require 'capistrano/dkdeploy/core'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
{% endhighlight %}

When you run

{% highlight shell %}
$ bundle exec cap -T
{% endhighlight %}

you should see all available tasks. You are now ready to deploy your first project!

<a href="/guides/static/configuration.html" class="button hollow float-right">Deploy your static website!</a>