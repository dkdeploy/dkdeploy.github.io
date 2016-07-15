---
title: "namespace file_access"
description: "This about file access"
section: "rake" 
layout: default
---

## set_owner_group

Set standard defined owner and group on the shared and release path

This task performs the tasks `:set_owner_group_of_shared_path` and `:set_owner_group_of_release_path` of

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_owner_group
{% endhighlight %}

#### Output

See outputs in tasks `:set_owner_group_of_shared_path` and `:set_owner_group_of_release_path`

## set_owner_group_of_shared_path

Set standard defined owner and group on the shared path

#### Configuration

{% highlight ruby %}
set :default_file_access_owner_of_shared_path, "{{site.data.constants.deploy.user}}"
set :default_file_access_group_of_shared_path, "{{site.data.constants.deploy.group}}"
{% endhighlight %}

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_owner_group_of_shared_path
{% endhighlight %}

#### Output

{% highlight shell %}
$ sudo chown {{site.data.constants.deploy.user}}:{{site.data.constants.deploy.group}} [project_path]/shared
{% endhighlight %}


## set_owner_group_of_release_path

Set recursively standard defined owner and group on the release path

#### Configuration

{% highlight ruby %}
set :default_file_access_owner_of_release_path, "{{site.data.constants.deploy.user}}"
set :default_file_access_group_of_release_path, "{{site.data.constants.deploy.group}}"
{% endhighlight %}

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_owner_group_of_release_path
{% endhighlight %}

#### Output

{% highlight shell %}
$ sudo chown -R {{site.data.constants.deploy.user}}:{{site.data.constants.deploy.group}} [project_path]/releases
{% endhighlight %}

## set_permissions

Set standard defined file permissions on the shared and release path

This task performs the tasks `:set_permissions_of_shared_path` and `:set_permissions_of_release_path` of

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_permissions
{% endhighlight %}

#### Output

See outputs in tasks `:set_permissions_of_shared_path` and `:set_permissions_of_release_path`

## set_permissions_of_shared_path

Set standard defined file permissions on the shared path

#### Configuration

{% highlight ruby %}
set :default_file_access_mode_of_shared_path, "u+rwx,g+rx,g-w,o-rwx"
{% endhighlight %}

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_permissions_of_shared_path
{% endhighlight %}

#### Output

{% highlight shell %}
$ sudo chmod u+rwx,g+rx,g-w,o-rwx [project_path]/shared
{% endhighlight %}

## set_permissions_of_release_path

Set recursively standard defined file permissions on the release path

#### Configuration

{% highlight ruby %}
set :default_file_access_mode_of_release_path, "u+rwx,g+rx,g-w,o-rwx"
{% endhighlight %}

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} file_access:set_permissions_of_release_path
{% endhighlight %}

#### Output

{% highlight shell %}
$ sudo chmod -R u+rwx,g+rx,g-w,o-rwx [project_path]/releases
{% endhighlight %}