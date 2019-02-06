---
title: "Static Website: Configuration"
description: "Configuration"
section: "guides"
layout: default
---

## Setup

If you have followed the instructions on the [Setup](/guides/setup/local_machine.html) pages then you are almost ready to go. In the following szenario we will deploy the output directory of a static site generator like [Jekyll](https://jekyllrb.com) to our server.

### Configuring deploy.rb

The **deploy.rb** is our global configuration. Everything inside can be overriden by stage-specific settings and tasks, i.e. **deploy/dev.rb**. Every variable we're using can be read by **fetch(:variable_name)** within our configuration.

{% highlight ruby %}
# the name of the application
set :application, 'my-first-website'

# This is the folder we're deploying on the server
set :copy_source,     './output'

# We can exclude files and directories we do not wish to deploy
set :copy_exclude, %w(
  .hidden
  **/.hidden
)
{% endhighlight %}

### Configuring  the dev stage

Lets say we just want to deploy the generated output to a VirtualBox server.

Open `deploy/dev.rb` and add the following settings:

{% highlight ruby %}
server '{{site.data.constants.deploy.host}}', user: '{{site.data.constants.deploy.user}}', roles: %w{web app}
set :deploy_to, "/var/www/#{fetch(:application)}"
set :keep_releases, 5
{% endhighlight %}

We fetch the **:application**  variable we set in **deploy.rb**, so the application will deploy into **{{site.data.constants.deploy.vendor_root}}**.

We also set ´**:keep_releases** to 5. That ensures that Capistrano will keep the last 5 successful releases on the server.

<div class="callout primary">
  If you want to know more about how to connect to your server then have a look at the <a href="http://capistranorb.com/documentation/advanced-features/properties/">Capistrano Manual</a>.
</div>

<a class="button hollow float-right" href="/guides/static/deployment.html">Next Page: Deployment</a>
