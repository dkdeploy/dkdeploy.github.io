---
title: "namespace current_folder"
description: "removes current folder unless it is a symlink"
section: rake
layout: default
---

## remove\_unless_symlinked

htdocs contains three subdirectories (**current**, **releases** and **shared**) where **current** usually is a symlink to the most recent release.
If no deployment was done before, **current** is a directory. If there already was a deployment earlier, it is a symlink.
This task deletes the **current** directory, unless it is a symlink.

#### Usage

in **config/deploy.rb**:
{% highlight ruby %}
before 'deploy:publishing', 'current_folder:remove_unlesss_symlinked'
{% endhighlight %}

#### Output

There is no output generated if the current directory is removed, if nothing is done, an event **info.ignoring_current_folder** is logged.