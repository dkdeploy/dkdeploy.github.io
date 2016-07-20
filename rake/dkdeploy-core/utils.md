---
title: "namespace utils"
description: "Utility tasks"
section: "rake" 
layout: default
---

## get\_current_path

This tasks returns the current release path.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} get_current_path
{% endhighlight %}

### Output

The newest release path is printed on console.

{% highlight shell-session%}
$ cap {{site.data.constants.deploy.stage}} get_current_path
  {{site.data.constants.deploy.release_folder}}
{% endhighlight %}

## upload_file

This uploads a file to the server specified in your stage configuration.

### Configuration

If the file path contains your `:copy_source` (for example **htdocs/newfile.html**) path this path will not be used on the server.

### Usage

The task should be used in your project root.
There are two ways to use this task:

#### Specify file path interactively

Then the task will ask you for a file name.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} utils:upload_file
{% endhighlight %}

##### Specify file path as task argument

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "utils:upload_file['htdocs/file.html']"
{% endhighlight %}

#### Output

{% highlight shell %}
      Creating directory {{site.data.constants.deploy.current_folder}}temp.
      01 mkdir -p {{site.data.constants.deploy.current_folder}}temp
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.008s
      Uploading temp/file.html to {{site.data.constants.deploy.current_folder}}temp/file.html.
      Uploading temp/file.html 100.0%
{% endhighlight %}

## download_file

This tasks downloads the specified file from the server in the specified stage.

### Variables

The variable `:deploy_to` defines the path in which the file to download is requested.
The variable `:local_dump_path` defines where the file will be downloaded.

Use following as code example:
{% highlight ruby %}
set :deploy_to, 'my_deploy_path'
set :local_dump_path, 'temp'
{% endhighlight %}

### Usage

Use this task in the project root.

There are two ways to use this task:

##### Specify file path interactively

Then the task will ask you for a file name.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} utils:download_file
{% endhighlight %}

##### Specify file path as task argument

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "utils:download_file['download_file.txt']"
{% endhighlight %}

### Output

{% highlight shell %}
      Downloading {{site.data.constants.deploy.current_folder}}download_file.txt to temp/download_file.dkdeploy-core.dev.txt.
      Downloading temp/download_file.dkdeploy-core.dev.txt 100.0%
{% endhighlight %}

### Additional informations

If the file exists already in your `:local_dump_path` it will be overwritten.

## watch_file

This task watches a file on the server (with **tail -f**). This is typically used to inspect logfiles of running servers.

### Configuration

### Variables

If no argument is specified, the variable `:watch_file_name` will be used.

{% highlight ruby %}
set :watch_file_name, '/var/log/apache2/access.log'
{% endhighlight %}

### Requirements

The capistrano user on the server needs to be able to access the file. File permissions on the server need to be setup correctly.

### Usage
Use this task in your project root.
If `:watch_file_name` variable is not set then the file path on the server has to be an argument.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "utils:watch_file['/var/log/apache2/access.log']"
{% endhighlight %}

or with the variable set

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} utils:watch_file
{% endhighlight %}

### Output

The output of file is watched with **tail -f**

### Additional information

As with all command tasks, you can use CTRL+C to end the process.

## rsync

This task copies data to the server with **rsync**.

### Configuration

The task uses the following variables:

* `:rsync_roles` - The capistrano roles to use. If not set then `:app` is used
* `:rsync_path` - the directory of the local file(s) ( if not set, then `:copy_source` is used)
* `:rsync_exclude` - file(s) that should be excluded
* `:release_path` - Path on the server where files are uploaded or synced
* `:ssh_options` - hash, specify ssh key files with `:keys` ssh user with `:user`

{% highlight ruby %}
set :rsync_roles, [:app, :db ]
set :rsync_path, 'htdocs'
set :rsync_exclude, ['file_to_exclude.txt']
set :release_path, 'deploy/current'
set :ssh_options, { keys:  ['.ssh/my-special-key'], user: '{{site.data.constants.deploy.user}}' }
{% endhighlight %}

#### Usage

Task is used in project root.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} utils:rsync
{% endhighlight %}

### Output

{% highlight shell %}
      Use host '{{site.data.constants.deploy.host}}' for rsync.
      01 rsync --verbose --recursive --perms --times --perms --perms --compress --force --cvs-exclude ./ --rsh="ssh -i '/Users/home-directory/projects/dkdeploy-core/tmp/test_app/../../.vagrant/machines/master/virtualbox/private_key'" {{site.data.constants.project.user}}@{{site.data.constants.deploy.host}}:/home/vagrant/deploy/current
      01 building file list ... done
      01 
      01 sent 976 bytes  received 20 bytes  1992.00 bytes/sec
      01 total size is 5037  speedup is 5.06
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.791s
{% endhighlight %}

## create_custom_directories

Creates a new directory in the shared directory on the server.

### Configuration

The variable `:deploy_path` is being used.

Use following as code example:
{% highlight ruby %}
set :deploy_to, 'deploy'
{% endhighlight %}

### Usage

Use this task in the project root.
This task can be used in two ways:

##### Interactively

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} utils:create_custom_directories
{% endhighlight %}

And then type the directories - separated by whitespace - that should be created.

##### With argument

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "utils:create_custom_directories['one_directory', 'two_directory']"
{% endhighlight %}

#### Output

{% highlight shell %}
      01 mkdir -p {{site.data.constants.deploy.path}}shared/one_directory,
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.347s
      02 mkdir -p {{site.data.constants.deploy.path}}shared/two_directory,
    ✔ 02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.007s
{% endhighlight %}

