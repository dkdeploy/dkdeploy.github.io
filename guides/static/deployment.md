---
title: "Static Website: Deployment"
description: "Deployment"
section: "guides"
layout: default
---

## Deployment

### Check if everything is fine

<div class="callout warning">
You can skip this step. Capistrano will run it every time you run <code>cap {{site.data.constants.deploy.stage}} deploy</code>.
</div>

Before we deploy we might want to check if we can connect to the server and create the necessary directories.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} deploy:check
{% endhighlight %}

On the server we have now created the following structure in **{{site.data.constants.deploy.vendor_root}}**:

{% highlight shell-session %}
.
|-- releases
`-- shared
{% endhighlight %}

## Deploying

If everything went ok then you are ready to actually deploy your website.

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} deploy
{% endhighlight %}

When we go back to the server we see a linked directory **current**:

{% highlight shell-session %}
.
|-- current -> {{site.data.constants.deploy.release_folder}}
|-- releases
|   `-- {{site.data.constants.deploy.release}}
|       |-- index.html
|       `-- REVISION
|-- revisions.log
`-- shared
{% endhighlight %}
