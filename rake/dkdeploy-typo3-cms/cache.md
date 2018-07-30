---
title: "namespace typo3:cms:cache"
description: "This is about TYPO3 functionality"
section: "rake"
layout: default
---

## clear\_file\_cache

Clears the TYPO3 file cache directory (typo3temp/Cache) on the server.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:cache:clear_file_cache
{% endhighlight %}

### Output

{% highlight shell-session %}
DEBUG Running /usr/bin/env [ -d {{site.data.constants.deploy.current_folder}}typo3temp/Cache ]
      as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG Command: [ -d {{site.data.constants.deploy.current_folder}}typo3temp/Cache ]
DEBUG Finished in 0.305 seconds with exit status 0 (successful).
INFO  Running /usr/bin/env rm -rf {{site.data.constants.deploy.current_folder}}typo3temp/Cache
      as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG Command: /usr/bin/env rm -rf {{site.data.constants.deploy.current_folder}}typo3temp/Cache
INFO  Finished in 0.005 seconds with exit status 0 (successful).
{% endhighlight %}

### Additional information

This task is added to the rollback tasks by default in the `dkdeploy-typo3-cms` gem.
