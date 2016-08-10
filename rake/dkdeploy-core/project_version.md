---
title: "namespace project_version"
description: "This about project versions"
section: "rake" 
layout: default
---

## update

Updates Version file on server. The file "Version" is required.

### Configuration

Use `:version_file_path` to add a new path for the file "Version".

{% highlight ruby %}
set :version_file_path, "version_file_directory"
{% endhighlight %}

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} project_version:update
{% endhighlight %}

### Output

{% highlight shell-session %}
1.0.0
{% endhighlight %}

### Additional information

The version of the project can be re-created, updated or moved.