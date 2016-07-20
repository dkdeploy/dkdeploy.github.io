---
title: "namespace assets"
description: "This is about assets"
section: "rake"
layout: default
---

#### Configuration

Add these variables in your deploy.rb file before using any of the tasks below.

{% highlight ruby %}
set :asset_folders, %w(fileadmin uploads)
set :asset_default_content, %w(fileadmin uploads)
set :asset_exclude_file, 'config/assets_exclude_file.txt'
{% endhighlight %}

## add_default_content

Adds default asset contents from **config/preseed/** to the server.
Files **fileadmin.tar.gz** and **uploads.tar.gz** will be uploaded to the shared assets directory.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:add_default_content
{% endhighlight %}

## download

Copies current contents from configured asset folders on the server to the local **./temp/assets** directory.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:download
{% endhighlight %}

### Output

Assets files are stored in the **./temp/assets/**.

## update

Adds asset contents from **./temp/assets** directory to the server.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:update
{% endhighlight %}

## cleanup

Removes contents of the folders configured in `:asset_folders` variable on the server.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:cleanup
{% endhighlight %}

### Output
Empty asset folders.

{% highlight shell-session %}
✔ 01 vagrant@{{site.data.constants.deploy.host}} 2.985s
  02 mkdir -p /var/www/typo3-cms-standard/htdocs/shared/assets/fileadmin
✔ 02 vagrant@{{site.data.constants.deploy.host}} 0.004s
  Cleaning folder uploads.
  03 rm -rf /var/www/typo3-cms-standard/htdocs/shared/assets/uploads
✔ 03 vagrant@{{site.data.constants.deploy.host}} 0.005s
  04 mkdir -p /var/www/typo3-cms-standard/htdocs/shared/assets/uploads
✔ 04 vagrant@{{site.data.constants.deploy.host}} 0.004s
{% endhighlight %}

## compile_compass

Compiles sass files in a css file.

#### Configuration

Set your sass file paths or whole directory paths from your project in **:compass_sources**.
Possible values for `:compass_compile_arguments` are `['--boring', '--environment', 'production']`.

{% highlight ruby %}
set :compass_sources, %w(
  htdocs/stylesheets/test1
  htdocs/stylesheets/test2
)
set :compass_compile_arguments, []
{% endhighlight %}

Add a **config.rb** file in your sass stylesheets directory.
{% highlight ruby %}
project_type = :stand_alone
css_dir = 'css'
sass_dir = 'src'
{% endhighlight %}

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:compile_compass
{% endhighlight %}

### Output

The task outputs the compiled CSS file/s in the configured directory from the **config.rb** file.

## add_htpasswd
Adds **.htpasswd** file to assets folder. Enter name and password which access the asset directory.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} assets:add_htpasswd
{% endhighlight %}

### Output

The **.htpasswd** file is stored in **htdocs/shared/**.
Password protection for assets directory.
