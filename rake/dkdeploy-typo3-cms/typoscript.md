---
title: "typo3:cms:typoscript"
description: "This is about Typoscript specific functionality"
section: "rake"
layout: default
---


## upload\_configs

Uploads TypoScript config files from local paths prefixed by variable ```copy_source```.

### Configuration

Here is an example for a multistage setup.

{% highlight ruby %}
set :typoscript_config_paths, 'typo3conf/ext/customer_extension/typoscript/config/'
{% endhighlight %}

Let's say you want a stage-specific config.txt, then you use the ```stage``` variable when you set your config file name:

{% highlight ruby %}
set :typoscript_config_file, "config.#{fetch(:stage)}.text"
{% endhighlight %}

### Usage

You would usually use this task during development with a tool like Guard:

{% highlight ruby %}
# Make sure configs are being uploaded before being merged
when %r{(Configuration/TypoScript/Constants/Stages/config\.dev\.txt|Configuration/TypoScript/Constants/config\.txt)}
  # upload and merge config.txt
  system 'cap dev typo3:cms:typoscript:upload_configs'
  system 'cap dev typo3:cms:typoscript:merge_configs'
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:typoscript:upload_configs
      01 mkdir -p /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants
    ✔ 01 vagrant@192.168.156.14 4.011s
      Uploading htdocs/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants/config.txt to /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants/config.txt...
      Uploading htdocs/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants/config.txt 100.0%
      Uploaded htdocs/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants/config.txt to /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkd_customer/Configuration/TypoScript/Constants/config.txt.
{% endhighlight %}

## upload\_pagets

Uploads PageTS files from local paths prefixed by variable `copy_source`

### Configuration

Here is an example for a multistage pagets.

{% highlight ruby %}
set :typoscript_pagets_paths, 'typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf'
{% endhighlight %}

For a stage specific file name set the variable like this:

{% highlight ruby %}
set :typoscript_pagets_file, 'PageTS.#{fetch(:stage)}.txt' 
{% endhighlight %}

If the parent folder from `typoscript_pagets_paths` on your local environment differ from `htdocs` then it must
be configured:

{% highlight ruby %}
set :copy_source, 'custom_htdocs_folder' 
{% endhighlight %}

### Usage

You would usually use this task during development and deployment:

{% highlight shell-session %}
  cap <stage> typo3:cms:typoscript:upload_pagets
{% endhighlight %}


### Output

{% highlight shell-session %}
00:00 typo3:cms:typoscript:upload_pagets
      01 mkdir -p /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf
    ✔ 01 vagrant@192.168.156.14 4.011s
      Uploading htdocs/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt to /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkd_customer/Configuration/TypoScript/TSConf/PageTS.txt...
      Uploading htdocs/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt 100.0%
      Uploaded htdocs/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt to /var/www/typo3-cms-standard/htdocs/current/typo3conf/ext/dkd_customer/Configuration/TypoScript/TSConf/PageTS.txt.
{% endhighlight %}


## merge\_pagets

### Configuration

TODO

### Usage

TODO

### Output

TODO
