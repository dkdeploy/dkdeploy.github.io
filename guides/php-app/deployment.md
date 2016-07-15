---
title: "Simple PHP application: Deployment"
description: "Deployment"
section: "guides"
layout: default
---

## First Deployment

It is now time to deploy our app to the server.

{% highlight shell-session%}
cap dev deploy
{% endhighlight %}

### Output

{% highlight shell-session%}
00:00 deploy:check:directories
      01 mkdir -p /var/www/faker-app/shared /var/www/faker-app/releases
Password:
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 3.295s
00:03 composer:local:check_status
      01 composer install --dry-run --no-interaction 2>&1
      01 Warning: This development build of composer is over 30 days old. It is recommended to update it by running "/usr/local/Cellar/composer/1.0.0-alpha8/libexec/composer.phar self-update" to get the latest version.
      01 Loading composer repositories with package information
      01 Installing dependencies (including require-dev) from lock file
      01 Nothing to install or update
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.162s
00:03 composer:local:run
      01 composer status --no-interaction 2>&1
      01 Warning: This development build of composer is over 30 days old. It is recommended to update it by running "/usr/local/Cellar/composer/1.0.0-alpha8/libexec/composer.phar self-update" to get the latest version.
      01 No local changes
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.145s
00:03 copy:create_release
      Generating the tar archive.
      01 tar -X /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/exclude.txt -cpzf /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz .
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.584s
      Uploading archive to /tmp/faker-app.
      02 mkdir -p /tmp/faker-app
    ✔ 02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.010s
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 10.42%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 20.2%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 30.62%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 40.4%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 50.17%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 60.59%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 70.37%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 80.14%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 90.56%
      Uploading /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb/faker-app_20160707-81896-48as6o.tar.gz 100.0%
      Creating directory /var/www/faker-app/releases/2016-07-07-09-36-56.
      03 mkdir -p /var/www/faker-app/releases/2016-07-07-09-36-56
    ✔ 03 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.010s
      Extracting archive to /var/www/faker-app/releases/2016-07-07-09-36-56.
      04 tar -xpzf /tmp/faker-app/faker-app_20160707-81896-48as6o.tar.gz
    ✔ 04 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.154s
      Removing /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb.
      05 rm -rf /var/folders/xg/c60lqnz50h1450nl98mrh0fh0000gp/T/d20160707-81896-1vbndxb
    ✔ 05 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.007s
      Removing /tmp/faker-app/faker-app_20160707-81896-48as6o.tar.gz.
      06 rm -f /tmp/faker-app/faker-app_20160707-81896-48as6o.tar.gz
    ✔ 06 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.020s
00:05 copy:set_current_revision
      01 echo "Local deployment for directory '.' at '2016-07-07 11:36:58 +0200'" >> REVISION
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.016s
00:05 deploy:symlink:release
      01 ln -s /var/www/faker-app/releases/2016-07-07-09-36-56 /var/www/faker-app/releases/current
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.023s
      02 mv /var/www/faker-app/releases/current /var/www/faker-app
    ✔ 02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.021s
00:05 deploy:cleanup
      Keeping 5 of 6 deployed releases on {{site.data.constants.deploy.host}}
      01 rm -rf /var/www/faker-app/releases/2016-07-05-15-40-08
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.107s
00:06 deploy:log_revision
      01 echo "Local deployment for directory '.' at '2016-07-07 11:36:58 +0200' on release '/var/www/faker-app/releases/2016-07-07-09-36-56' by '{{site.data.constants.deploy.user}}'" >> /var/www/faker-app/revisions.log
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.011s
{% endhighlight %}

We should no be able to access the site at **http://{{site.data.constants.deploy.host}}**:

<img src="/assets/images/php_sample_app.png" class="thumbnail">

<div class="callout warning">
Please bear in mind that we always run composer locally. If you change  your <b>composer.json</b> file or remove the <b>vendor</b> folder than the deployment will be halted.
</div>

{% highlight shell-session%}
00:00 deploy:check:directories
      01 mkdir -p /var/www/faker-app/shared /var/www/faker-app/releases
    ✔ 01 vagrant@sample-app 0.408s
00:00 composer:local:check_status
      01 composer install --dry-run --no-interaction 2>&1
      01 Warning: This development build of composer is over 30 days old. It is recommended to update it by running "/usr/local/Cellar/composer/1.0.0-alpha8/libexec/composer.phar self-update" to get the latest version.
      01 Loading composer repositories with package information
      01 Installing dependencies (including require-dev) from lock file
      01   - Installing fzaninotto/faker (v1.6.0)
      01
    ✔ 01 dkd-hayes@localhost 1.630s
      Please run command "/usr/bin/env composer install --no-interaction"
{% endhighlight %}

Usually there is a built job on a Continous Delivery Server like **Jenkins** that will run composer outside of Capistrano once, but in our case we want to be sure that all our Composer dependencies are being met.

### Automate composer update

You can add these lines of code either to your **deploy.rb** or **deploy/dev.rb** to install all packages for PHP.

{% highlight ruby %}
run_locally do
  invoke 'composer:local:run', 'install', '--no-interaction'
end
{% endhighlight %}

## Clearing OPcache

We want to make sure that our app will be fully reloaded after deployment. In order to get this running we will automatically upload a PHP file and call it. This will empty the OpCache of PHP. 

### Configuration

In our sample application the  **document_root** is the **web** folder. That means we have to configure our task accordingly so it uploads the clear cache file to location it can reach with curl.

In our **deploy.rb** we add the following line:

{% highlight ruby %}
set :remote_web_root_path, 'web'
{% endhighlight %}

### Run manually

{% highlight shell-session%}
cap dev php:clear_opcache
{% endhighlight %}

#### Output

{% highlight shell-session%}
00:00 php:clear_opcache
      Uploading /Users/dkd-hayes/.rvm/gems/ruby-2.1.8/gems/dkdeploy-php-7.0.0/lib/capistrano/dkdeploy/../../../vendor/opcache_reset.php 100.0%
      Call URL http://localhost:8877/opcache_reset.php
      Result 200 - OK
      01 rm -f /var/www/faker-app/current/web/opcache_reset.php
    ✔ 01 dkd-hayes@localhost 0.009s
{% endhighlight %}

<div class="callout primary">As you can see above, the uploaded file will be removed immediately.</div>

### Run automatically

In our **deploy.rb** we add the following lines:

{% highlight ruby %}
after 'deploy:finished', 'php:clear_opcache'
{% endhighlight %}


## Customizing group and file permissions

## 