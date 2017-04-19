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

### Configuration

TODO

### Usage

TODO

### Output

TODO

## merge\_configs

### Configuration

TODO

### Usage

TODO

### Output

TODO

## merge\_pagets

Merge remote stage specific PageTS file into project-wide PageTS file.


### Configuration

Here is an example for a multistage PageTs:

{% highlight ruby %}
set :typoscript_pagets_paths, 'typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf'
{% endhighlight %}

The configured paths should have a `Stages` sub-directory with stage specific PageTs files. 

Example: `dkdeploy_extension/Configuration/TypoScript/TSConf/Stages/PageTS.<StageName>.txt`

If path or `PageTS.<StageName>.txt` does not exists, task will be skipped for this path.

And a project-wide PageTS file with a default filename `PageTS.txt`. 

You can configure your own filename:

{% highlight ruby %}
set :typoscript_pagets_file, 'filename.txt' 
{% endhighlight %}


If project-wide PageTS does not exists, it will be created.




### Usage

You would usually use this task during development and deployment:

{% highlight shell-session %}
  cap <stage> typo3:cms:typoscript:merge_pagets
{% endhighlight %}

It is recommended to upload pagets before:

{% highlight shell-session %}
  cap <stage> typo3:cms:typoscript:upload_pagets
{% endhighlight %}



### Output

{% highlight shell-session %}
cap dev typo3:cms:typoscript:merge_pagets["typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf"]
00:00 typo3:cms:typoscript:merge_pagets
      01 echo '' >> /var/www/dkdeploy/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt
    ✔ 01 vagrant@dkdeploy-typo3-cms.dev 0.005s
      02 cat /var/www/dkdeploy/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/Stages/PageTS.dev.txt >> /var/www/dkdeploy/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt
    ✔ 02 vagrant@dkdeploy-typo3-cms.dev 0.005s
      Merged /var/www/dkdeploy/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/Stages/PageTS.dev.txt with /var/www/dkdeploy/current/typo3conf/ext/dkdeploy_extension/Configuration/TypoScript/TSConf/PageTS.txt.
{% endhighlight %}