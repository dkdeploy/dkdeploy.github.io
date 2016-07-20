---
title: "namespace deploy:enhanced_symlinks"
description: "<A short description>"
section: "rake" 
layout: default
---


## linked_dirs

**deploy.rb** contains a hash of `:enhanced_linked_dirs`. The linked_dirs task reads this hash and creates the directories listed in the key of this hash, if they do not exist.

#### Configuration

Listing of `:enhanced_linked_dirs` in **deploy.rb:**
{% highlight ruby %}
set :enhanced_linked_dirs, {
  'assets/fileadmin' => 'fileadmin',
  'assets/l10n' => 'typo3conf/l10n'
}
{% endhighlight %}

### Usage

linked_dirs is run automatically after the Capistrano task of the same name.

**dkdeploy_core/lib/capistrano/dkdeploy**:
{% highlight ruby %}
after 'deploy:check:linked_dirs', 'deploy:enhanced_symlinks:check:linked_dirs'
{% endhighlight %}

## make_linked_dirs

**deploy.rb** contains a hash of `enhanced_linked_dirs`. The **make_linked_dirs** task reads this hash and creates the directories listed in the value of this hash if they do not exist.

### Configuration

Listing of `:enhanced_linked_dirs` in **deploy.rb:**
{% highlight ruby %}
set :enhanced_linked_dirs, {
  'assets/fileadmin' => 'fileadmin',
  'assets/l10n' => 'typo3conf/l10n'
}
{% endhighlight %}

### Usage

**make_linked_dirs** is run automatically after the Capistrano task of the same name.

{% highlight ruby %}
after 'deploy:check:make_linked_dirs', 'deploy:enhanced_symlinks:check:make_linked_dirs'
{% endhighlight %}

## linked_files

**deploy.rb** contains a hash of `:enhanced_linked_files`. The **linked_files** task reads this hash - if a file in the key of this hash does not exist, it logs an error and outputs the message **linked_file_does_not_exist**

### Configuration

Listing of `:enhanced_linked_files` in  **deploy.rb:**
{% highlight ruby %}
set :linked_files, {
  'assets/db/schema' => 'db_definition'
}
{% endhighlight %}

### Usage

**linked_files** is run automatically after the Capistrano task of the same name.

{% highlight shell %}
after 'deploy:check:linked_files', 'deploy:enhanced_symlinks:check:linked_files'
{% endhighlight %}

### Output

If a linked file does not exist, the task ends with exit status 1, logs an error in Capistrano and writes the message to stdout.

## symlink:linked_dirs

**deploy.rb** contains a hash of  `:enhanced_linked_dirs`. The linked_dirs task reads this hash and creates symlinks to the directories in the key of this hash, in the locations specified in the value of the hash.

### Configuration

Listing of  `enhanced_linked_dirs` in **deploy.rb**:
{% highlight ruby %}
set :enhanced_linked_dirs, {
  'assets/fileadmin' => 'fileadmin',
  'assets/l10n' => 'typo3conf/l10n'
}
{% endhighlight %}

### Usage

**linked_dirs** is run automatically after the Capistrano task of the same name.

{% highlight shell %}
after 'deploy:symlink:linked_dirs', 'deploy:enhanced_symlinks:symlink:linked_dirs'
{% endhighlight %}

## symlink:linked_files

**deploy.rb** contains a hash of `:enhanced_linked_files`. The linked_files task reads this hash and creates symlinks to the files in the key of this hash, in the locations specified in the value of the hash.

### Configuration

Use `:copy_source` for variables inside your text.

Example:
{% highlight ruby %}
set :local_web_root_path, "my_web_root_path"
{% endhighlight %}

### Usage

**linked_files** is run automatically after the Capistrano task of the same name.

{% highlight shell %}
after 'deploy:symlink:linked_files', 'deploy:enhanced_symlinks:symlink:linked_files'
{% endhighlight %}
