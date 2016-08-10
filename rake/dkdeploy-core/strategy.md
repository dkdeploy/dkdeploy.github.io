---
title: "namespace copy"
description: "SCM strategy"
section: "rake" 
layout: default
---

Dkdeploy uses by default it's own copy strategy and overwrites the `:scm` constant (with `:copy`). The tasks in this namespace are wrappers around the copy_strategy.
If you want to change the `:scm` strategy, for example to `:git`, you could customize that for your project. In that case these tasks are irrelevant.

## check

Checks if the local source directory ( set in the `:copy_source` variable ) exists. Raises a fatal exception if the directory does not exist. Otherwise no message is shown.

## create_release

Copies the source file structure to the server excluding the not wanted elements.
Usage with 

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} copy:create_release
{% endhighlight %}

### Requirements

* **tar** needs to be installed on both machines.
* SSH config that enables SSH connection to the server.

### Output

Example output
{% highlight shell %}
00:00 copy:create_release
      Generating the tar archive.
      01 tar -X /var/folders/jv/hx47v28x4d9531nsrfm40fm00000gp/T/d20160610-8620-5fg78w/exclude.txt -cpzf /var/folders/jv/hx47v28x4d9531nsrfm40fm00000gp/T/d20160610-8620-5fg78w/test_app_20160610-8620-14wmv1u.tar.gz .
    ✔ 01 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.010s
      Uploading archive to /tmp/test_app.
      02 mkdir -p /tmp/test_app
    ✔ 02 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.305s
      Uploading /var/folders/jv/hx47v28x4d9531nsrfm40fm00000gp/T/d20160610-8620-5fg78w/test_app_20160610-8620-14wmv1u.tar.gz 100.0%
      Creating directory {{site.data.constants.deploy.current_folder}}.
      03 mkdir -p {{site.data.constants.deploy.current_folder}}
    ✔ 03 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.006s
      Extracting archive to {{site.data.constants.deploy.current_folder}}.
      04 tar -xpzf /tmp/test_app/test_app_20160610-8620-14wmv1u.tar.gz
    ✔ 04 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.006s
      Removing /var/folders/jv/hx47v28x4d9531nsrfm40fm00000gp/T/d20160610-8620-5fg78w.
      05 rm -rf /var/folders/jv/hx47v28x4d9531nsrfm40fm00000gp/T/d20160610-8620-5fg78w
    ✔ 05 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.004s
      Removing /tmp/test_app/test_app_20160610-8620-14wmv1u.tar.gz.
      06 rm -f /tmp/test_app/test_app_20160610-8620-14wmv1u.tar.gz
    ✔ 06 {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}} 0.004s
{% endhighlight %}

## set_current_revision

Sets the current revision that will be deployed and returns the current revision message but does not print this message itself. 
