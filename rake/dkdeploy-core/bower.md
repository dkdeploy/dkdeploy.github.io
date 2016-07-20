---
title: "namespace bower"
description: "This is about bower"
section: "rake"
layout: default
---


## run

Runs a given **bower** command in a given directory.
If you manage your (frontend) package with bower this needs to be run before deployment.

See [bower.io](http://bower.io/) for details about bower.

### Configuration

By default dkdeploy will assume the `:bower_path` path as location of your bower.json file.
You can overwrite this by setting the variable `:bower_path` in your Capistrano configuration.
By default the `:bower_path` variable is fetched from the `:copy_source` variable.

This path is relative to your current working directory.

{% highlight ruby %}
set :bower_path, "my_bower_path"
{% endhighlight %}

### Requirements

The directory nees to exist and a **bower.json** file should exist in that directory.

### Usage

#### Where to use this task

In your project directory.

#### Examples

With the variables from your Capistrano configuration:

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "bower:run[install]"
{% endhighlight %}

or with explicitly specifying the directory:

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "bower:run[install,another_directory]"
{% endhighlight %}

### Output

For example after running install command:

* The packages (set in **bower.json**) should be installed (or updated) in your **bower_components/** directory
* You should see typical bower output like **bower [package]#version install**

### Additional informations

These rake tasks are developed with and tested for Version 1.5.2. Keep this in mind if the bower command usage is changed in future versions.

## run_all

Run_all is like the run command, but it executes the **bower** command in multiple directories. If you manage your (frontend) package with **bower** this needs to be run before deployment.

See [bower.io](http://bower.io/) for details about bower.

### Configuration

#### Variables

By default dkdeploy will assume the `:bower_paths` path as directories of your bower.json files. You can overwrite this by setting the variable `:bower_paths` in your Capistrano configuration. By default, the  `:bower_paths` variable fetches from the `:copy_source` variable.

Again, the multiple directories are relative the current working directory.

Use following as code example:
{% highlight ruby %}
set :bower_path, "my_bower_path, my_bower_path"
{% endhighlight %}

#### Requirements

In all your specified directories you need **bower.json** files. And the directories need to exist.

### Usage

#### Where to use this task

In your project directory.

#### Example

With the variables from your Capistrano configuration:

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "bower:run_all[install]"
{% endhighlight %}

or with explicitly specifying the directories:

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} "bower:run_all[install,one_directory,two_directory]"
{% endhighlight %}

### Output

For example after running install command:

* The packages (set in **bower.json**) should be installed (or updated) in the **bower_components/** directories of the specified directories
* You should see typical bower output like **bower [package]#version install**
* The output should appear as often as you have directories specified

### Additional informations

These rake tasks are developed with and tested for Version 1.5.2. Keep this in mind if the bower command usage is changed in future versions.
