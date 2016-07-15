---
title: "namespace typo3:cms:cli"
description: "This is about TYPO3 CLI functionality"
section: "rake"
layout: default
---
## Global configuration

Overrides the default variables in your `deploy.rb`.
{% highlight ruby %}
set :typo3_environment_cli, {
     TYPO3_COMPOSER_AUTOLOAD: 1,
     TERM: 'screen-256color'
}
{% endhighlight %}

## run

Runs the TYPO3 `cli_dispatch.phpsh` script with given parameters.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:cli:run[extbase,help]
{% endhighlight %}

### Output

{% highlight shell-session %}
DEBUG [be9d1912] Finished in 0.793 seconds with exit status 0 (successful).
DEBUG [482f29d7] Running /usr/bin/env [ -e {{site.data.constants.deploy.current_folder}}typo3/cli_dispatch.phpsh ] as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG [482f29d7] Command: [ -e {{site.data.constants.deploy.path}}typo3/cli_dispatch.phpsh ]
DEBUG [482f29d7] Finished in 0.005 seconds with exit status 0 (successful).
INFO [5d610322] Running /usr/bin/env php {{site.data.constants.deploy.current_folder}}typo3/cli_dispatch.phpsh extbase help as {{site.data.constants.deploy.user}}@{{site.data.constants.deploy.host}}
DEBUG [5d610322]     Extbase 6.2.0
DEBUG [5d610322]     usage: /usr/bin/env {{site.data.constants.deploy.path}}typo3/cli_dispatch.phpsh extbase <command identifier>
DEBUG [5d610322]
DEBUG [5d610322]     The following commands are currently available:
DEBUG [5d610322]
DEBUG [5d610322]     EXTENSION "EXTENSIONMANAGER":
DEBUG [5d610322]     -------------------------------------------------------------------------------
DEBUG [5d610322]       extension:install                        Installs an extension by key
DEBUG [5d610322]       extension:uninstall                      Uninstalls an extension by key
DEBUG [5d610322]
DEBUG [5d610322]
DEBUG [5d610322]     EXTENSION "EXTBASE":
DEBUG [5d610322]     -------------------------------------------------------------------------------
DEBUG [5d610322]       help                                     Display help for a command
DEBUG [5d610322]
DEBUG [5d610322]
DEBUG [5d610322]     EXTENSION "LANG":
DEBUG [5d610322]     -------------------------------------------------------------------------------
DEBUG [5d610322]       language:update                          Update language file for each
DEBUG [5d610322]                                                extension
DEBUG [5d610322]
DEBUG [5d610322]
DEBUG [5d610322]       cleanup:log
DEBUG [5d610322]
DEBUG [5d610322]     See '/usr/bin/env {{site.data.constants.deploy.current_folder}}typo3/cli_dispatch.phpsh extbase help <command identifier>' for more information about a specific command.
DEBUG [5d610322]
INFO [5d610322] Finished in 0.580 seconds with exit status 0 (successful).
{% endhighlight %}

## upload_wrapper

Creates and uploads wrapperscript for TYPO3 `cli_dispatch.phpsh` which adds additional environment variables.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:cli:upload_wrapper
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:cli:upload_wrapper
      Uploading {{site.data.constants.deploy.current_folder}}typo3_cms_cli_dispatch.sh 100.0%
{% endhighlight %}