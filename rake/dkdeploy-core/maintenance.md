---
title: "namespace maintenance"
description: "maintenance"
section: "rake"
layout: default
---

## enable

Creates a maintenance.json file.

#### Configuration

none

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} maintenance:enable
{% endhighlight %}


#### Output

Creates the file `shared_path/config/maintenance.json` with no content

## enable_permanent

Creates a maintenance.json file.

#### Configuration

none

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} maintenance:enable_permanent
{% endhighlight %}


#### Output

Creates the file `shared_path/config/maintenance.json` with enabled_permanent: true

## disable

Removes a maintenance.json file. Ony works if the maintenance mode wasnt set with enable_permanent, if so use disable_permanent.

#### Configuration

none

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} maintenance:disable
{% endhighlight %}


## disable_permanent

Removes a maintenance.json file.

#### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} maintenance:disable_permanent
{% endhighlight %}


#### Output

none

<div class="callout warning">
Needs additional processing ie. apache with mod_rewrite and condition on existence of the file maintenance.json
and serving a maintenance html page.
</div>