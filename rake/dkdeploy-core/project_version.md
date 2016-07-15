---
title: "namespace project_version"
description: "This about project versions"
section: "rake" 
layout: default
---

## update

Update Version file on server

The file "Version" is requered.

#### Configuration

Use `:version_file_path` add new path for file "Version".

{% highlight ruby %}
set :version_file_path, "version_file_directory"
{% endhighlight %}

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} project_version:update
{% endhighlight %}


#### Output

`1.0.0`

#### Additional information

The version of the project can be re-created, updated or moved