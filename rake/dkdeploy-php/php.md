---
title: "namespace php"
description: "This is about PHP functionality"
section: "rake"
layout: default
---

## version

Show the php version on the server.

### Usage

{% highlight shell %}
  $ cap {{site.data.constants.deploy.stage}} php:version
{% endhighlight %}

### Output

{% highlight shell %}
  Running /usr/bin/env php -v as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
  DEBUG Command: /usr/bin/env php -v
  DEBUG PHP 5.3.10-1ubuntu3.15 with Suhosin-Patch (cli) (built: Oct 29 2014 12:19:04)
  DEBUG Copyright (c) 1997-2012 The PHP Group
  DEBUG Zend Engine v2.3.0, Copyright (c) 1998-2012 Zend Technologies
  DEBUG with Xdebug v2.1.0, Copyright (c) 2002-2010, by Derick Rethans
  DEBUG Finished in 0.359 seconds with exit status 0 (successful).
  INFO PHP 5.3.10-1ubuntu3.15 with Suhosin-Patch (cli) (built: Oct 29 2014 12:19:04)
  Copyright (c) 1997-2012 The PHP Group
  Zend Engine v2.3.0, Copyright (c) 1998-2012 Zend Technologies
      with Xdebug v2.1.0, Copyright (c) 2002-2010, by Derick Rethans
{% endhighlight %}

## clear\_apc\_cache

Clears the APC PHP Cache on the server.

### Configuration

{% highlight ruby %}
  set :remote_apc_file_name, 'apc_clear.php'
  set :local_apc_file, File.join(__dir__, '..', '..', '..', 'vendor', 'apc_clear.php')
{% endhighlight %}

### Usage

{% highlight shell %}
  $ cap {{site.data.constants.deploy.stage}} php:clear_apc_cache
{% endhighlight %}

### Output

{% highlight shell %}
  DEBUG Running /usr/bin/env [ -f {{site.data.constants.deploy.current_folder}}./apc_clear.php ]
        as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
  DEBUG Command: [ -f {{site.data.constants.deploy.current_folder}}./apc_clear.php ]
  DEBUG Finished in 0.275 seconds with exit status 1 (failed).
  DEBUG Uploading dkdeploy-php-3.0.0/lib/capistrano/dkdeploy/../../../vendor/apc_clear.php 0.0%
  INFO  Uploading /dkdeploy-php-3.0.0/lib/capistrano/dkdeploy/../../../vendor/apc_clear.php 100.0%
  INFO  Call URL {{site.data.constants.deploy.domain}}apc_clear.php
  INFO  Result 200 - OK
  INFO  Running /usr/bin/env rm -f {{site.data.constants.deploy.current_folder}}./apc_clear.php
        as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
  DEBUG Command: /usr/bin/env rm -f {{site.data.constants.deploy.current_folder}}./apc_clear.php
  INFO  Finished in 0.006 seconds with exit status 0 (successful).
{% endhighlight %}

## clear\_opcache

Clears the PHP OPcache on the stage.

### Configuration

{% highlight ruby %}
  set :remote_opcache_file_name, 'opcache_reset.php'
  set :local_opcache_file, File.join(__dir__, '..', '..', '..', 'vendor', 'opcache_reset.php')
{% endhighlight %}

### Usage

{% highlight shell %}
  $ cap {{site.data.constants.deploy.stage}} php:clear_opcache
{% endhighlight %}

### Output

{% highlight shell %}
  php:clear_opcache
  Uploading {{site.data.constants.project.workspace}}dkdeploy-php-6.0.0/lib/capistrano/dkdeploy/../../../vendor/opcache_reset.php 100.0%
  Call URL {{site.data.constants.deploy.domain}}opcache_reset.php
  Result 200 - OK
  rm -f {{site.data.constants.deploy.current_folder}}./opcache_reset.php
{% endhighlight %}
