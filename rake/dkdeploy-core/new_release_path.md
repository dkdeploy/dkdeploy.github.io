---
title: "namespace deploy"
description: "This is about deployment"
section: "rake"
layout: default
---


## new\_release\_path

Generate the new release path name.

### Configuration

Optionally a suffix could be added to the release path.

For this set the environment variable BUILD_TAG to enable this suffix.
If the suffix is enabled, JOB_NAME and BUILD_NUMBER

#### Capistrano Default

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} deploy
{% endhighlight %}

will use the default releases-folder:  **{{site.data.constants.deploy.releases_folder}}**

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} deploy:new_release_path
{% endhighlight %}

= **{{site.data.constants.deploy.release_folder}}**

or

{% highlight shell %}
$ BUILD_TAG=1 JOB_NAME=foo BUILD_NUMBER=bar cap {{site.data.constants.deploy.stage}} deploy:new_release_path
{% endhighlight %}

= **{{site.data.constants.deploy.release2_folder}}**



## failed

Handle deployment errors

Capistrano revert the bad code and redeploy, when a failed deployment situations. ... 

...

## cleanup\_rollback

Remove and archive rolled-back release.

...

## fail

This task simulates a failing deployments. It is used for the tests - especially for testing the Rollback Manager.

#### Configuration

There is nothing to configure, the task simply raises an exception.

#### Usage

Example usage: 
{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} deploy:fail
{% endhighlight %}

#### Output

A console output that the deployment has failed.
