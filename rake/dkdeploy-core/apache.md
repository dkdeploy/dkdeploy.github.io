---
title: "namespace apache"
description: "This is about apache"
section: "rake"
layout: default
---

## htaccess

Add stage specific configuration to htaccess file. 

### Configuration

You can add a stage specific htaccess file in **/config/etc/apache2/conf**.

If there is already a **.htaccess** file within the webroot than the content of this file will be appended to it.
If no .htaccess file exists it will be created.

By default dkdeploy will assume the `:copy_source` path as the destination for the .htaccess file.
You can overwrite this by setting the variable `:local_web_root_path` in your Capistrano configuration.

{% highlight ruby %}
set :local_web_root_path, "my_web_root_path"
{% endhighlight %}

<div class="callout primary">
If you call the task without having configured the variable <code class="highlighter-rouge">:local_web_root_path</code> then the CLI will ask for it. 
</div>

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} apache:htaccess
{% endhighlight %}

This will generate a **.htaccess** file within your **local\_webroot** (usually htdocs).

{% highlight xml %}
<FilesMatch 'index.php'>
  Allow from all
</FilesMatch>
<Files 'favicon.ico'>
   Deny from all
</Files>
{% endhighlight %}
