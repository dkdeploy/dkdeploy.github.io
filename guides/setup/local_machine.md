---
title: "Setup: Your local machine"
description: "TODO"
section: guides
layout: "default"
---

## Requirements

* Linux or Mac OS X
* Ruby 2.1.x or newer. We recommend using [RVM](https://rvm.io) or [rbenv](https://github.com/rbenv/rbenv) for installing different Ruby versions on your local machine.
* Rubygems and Bundler

Please follow the install instructions of one of these projects.

#### Create a Ruby Version File in your working directory

The **ruby-version.**

{% highlight shell-session%}
echo 2.2.3 > .ruby-version
{% endhighlight %}

Check if Ruby and Bundler are installed:

##### Ruby

{% highlight shell-session%}
ruby -v
{% endhighlight %}

This will output your active Ruby Interpreter:

{% highlight shell-session%}
  ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
{% endhighlight %}

##### Bundler

{% highlight shell-session%}
bundle -v
{% endhighlight %}

If Bundler is not installed you have to do it manually:

{% highlight shell-session%}
gem install bundler
{% endhighlight %}

<a class="button hollow float-right" href="/guides/setup/server.html">Next: The remote server</a>
