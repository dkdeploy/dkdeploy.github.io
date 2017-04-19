---
title: "namespace typo3:cms"
description: "This is about TYPO3 functionality"
section: "rake"
layout: default
---


## clear\_typo3temp

Deletes recursively files within the **typo3temp** folder.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:clear_typo3temp
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:clear_typo3temp
      Clearing typo3temp directory...
      01 rm -rf {{site.data.constants.deploy.current_folder}}typo3temp/*
      ✔ 01 vagrant@{{site.data.constants.deploy.host}} 2.272s
{% endhighlight %}

## enable\_install\_tool

Creates the dummy file **ENABLE\_INSTALL\_TOOL** within the **typo3conf** folder. This allowes administrators in TYPO3 to access the install tool.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:enable_install_tool
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:enable_install_tool
      Enabling install tool...
      01 mkdir -p {{site.data.constants.deploy.current_folder}}typo3conf
    ✔ 01 vagrant@{{site.data.constants.deploy.host}} 2.272s
      02 touch {site.data.constants.deploy.current_folder}}typo3conf/ENABLE_INSTALL_TOOL
    ✔ 02 vagrant@{{site.data.constants.deploy.host}} 0.005s
{% endhighlight %}

## disable\_install\_tool

Removes the dummy file **ENABLE\_INSTALL\_TOOL** within the **typo3conf** folder. This disables the TYPO3 install tool.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:disable_install_tool
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:disable_install_tool
      Disabling install tool...
      01 rm {{site.data.constants.deploy.current_folder}}typo3conf/ENABLE_INSTALL_TOOL
    ✔ 01 vagrant@{{site.data.constants.deploy.host}} 0.005s
{% endhighlight %}


## create\_db\_credentials

Creates the TYPO3 configuration for the database and uploads it to the server. 



### Configuration

You need to create your db credentials first. Have a look at the <a href="/rake/dkdeploy-core/db.html#uploadsettings">db:upload_settings</a> task to upload your settings to the server.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:create_db_credentials
{% endhighlight %}

### Output

A PHP file named db_settings.{{site.data.constants.deploy.stage}}.php is being created and uploaded to the server.

{% highlight php %}
<?php
$GLOBALS['TYPO3_CONF_VARS']['DB']['database'] = '{{site.data.constants.mysql.database}}';
$GLOBALS['TYPO3_CONF_VARS']['DB']['host'] = '{{site.data.constants.mysql.host}}';
$GLOBALS['TYPO3_CONF_VARS']['DB']['username'] = '{{site.data.constants.mysql.username}}';
$GLOBALS['TYPO3_CONF_VARS']['DB']['password'] = '{{site.data.constants.mysql.password}}';
$GLOBALS['TYPO3_CONF_VARS']['DB']['port'] = {{site.data.constants.mysql.port}};
{% endhighlight %}

{% highlight shell-session %}
00:00 typo3:cms:create_db_credentials
      Downloading db_settings.dev.yaml 100.0%
      Uploading {{site.data.constants.deploy.shared_path}}config/db_settings.{{site.data.constants.deploy.stage}}.php 100.0%
{% endhighlight %}

## fetch\_extension

Download an extension via rsync to your local workspace. This task supports interaction.

### Interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:fetch_extension
{% endhighlight %}

You will be asked for the name of the extension:

{% highlight shell-session %}
Please enter name of extension
{% endhighlight %}

<div class="callout warning">
The name of the extension is the name of its folder within {{site.data.constants.deploy.current_folder}}typo3conf/ext/.
</div>

### Non-interactive Usage

You can avoid beeing asked by the command line if you add the name of the requested extension as an argument. Just make sure to use quotes if you're using arguments.

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} "typo3:cms:fetch_extension[dkd_compress]"
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:fetch_extension
      Downloading dkd_compress...
      Downloading temp/extensions/dkd_compress/ext_localconf.php 100.0%
      Downloading temp/extensions/dkd_compress/ext_tables.php 100.0%
      Downloading temp/extensions/dkd_compress/Classes/Minifier.php 100.0%
      Downloading temp/extensions/dkd_compress/Classes/Handler.php 100.0%
      Downloading temp/extensions/dkd_compress/Classes/ResourceCompressor.php 100.0%
      Downloading temp/extensions/dkd_compress/Classes/Utility/PathUtility.php 100.0%
      Downloading temp/extensions/dkd_compress/ext_emconf.php 100.0%
      Downloading temp/extensions/dkd_compress/composer.json 100.0%
      Downloading temp/extensions/dkd_compress/Tests/Unit/MinifierTest.php 100.0%
      Downloading temp/extensions/dkd_compress/Tests/Fixture/dkd.gif 100.0%
      Downloading temp/extensions/dkd_compress/Tests/Fixture/css_with_image.css 100.0%
      Downloading temp/extensions/dkd_compress/ext_icon.gif 100.0%
      Rsyncing dkd_compress...
      01 rsync -vrS --force -C --delete --exclude='.git/' --exclude='.svn/' temp/extensions/dkd_compress/ htdocs/typo3conf/ext/dkd_compress/
      01 building file list ... done
      01 composer.json
      01 ext_emconf.php
      01 ext_icon.gif
      01 ext_localconf.php
      01 ext_tables.php
      01 Classes/Handler.php
      01 Classes/Minifier.php
      01 Classes/ResourceCompressor.php
      01 Classes/Utility/PathUtility.php
      01 Tests/Fixture/css_with_image.css
      01 Tests/Fixture/dkd.gif
      01 Tests/Unit/MinifierTest.php
      01
      01 sent 22288 bytes  received 284 bytes  45144.00 bytes/sec
      01 total size is 21342  speedup is 0.95
    ✔ 01 vagrant@localhost 0.073s
{% endhighlight %}

## generate\_encryption\_key

Creates a random encryption key every time you call it. This key can be used for the **create_encryption_key_file** task.

### Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:generate_encryption_key
{% endhighlight %}

### Output

This will output a random String like 2276e037022a24735aa080cf89497974819ab27d83857a1323f235e6a52a7fd9a69bd65254daccfd9a563af0f8b86c62.

## create\_encryption\_key\_file

This will create a file encryption.php and upload it to {{site.data.constants.deploy.shared_folder}}config on the server.

### Configuration

<div class="callout warning">
The encryption key should only be created once during setup. This can be handled by a special CI-Job or manuelly invoked by the user. <b>It should never show up in you version control system.</b>
</div>

### Interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:create_encryption_key_file
{% endhighlight %}

The CLI will ask you to enter a key.

### Non-interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} "typo3:cms:create_encryption_key_file[YourEncryptionKey]"
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:create_encryption_key_file
      01 mkdir -p {{site.data.constants.deploy.shared_folder}}config
    ✔ 01 vagrant@{{site.data.constants.deploy.host}} 7.827s
      Uploading {{site.data.constants.deploy.shared_folder}}config/encryption_key.php 100.0%
{% endhighlight %}

The content of the PHP-file will look like this:
{% highlight php %}
<?php $GLOBALS['TYPO3_CONF_VARS']['SYS']['encryptionKey'] = 'YourEncryptionKey';
{% endhighlight %}

## create\_install\_tool\_password\_file

Creates a password for the TYPO Install Tool and uploads it to the server.

### Interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:create_install_tool_password_file
{% endhighlight %}

The CLI will ask you to enter a key.

### Non-interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} "typo3:cms:create_install_tool_password_file[INSTALL_TOOL_PASSWORD]"
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:create_install_tool_password_file
      01 mkdir -p {{site.data.constants.deploy.shared_folder}}config
{% endhighlight %}

## add\_admin\_user

Adds a an admin user to the TYPO3 installation on the server.

### Interactive Usage

{% highlight shell-session %}
$ cap {{site.data.constants.deploy.stage}} typo3:cms:add_admin_user
{% endhighlight %}

### Output

{% highlight shell-session %}
00:00 typo3:cms:add_admin_user
      Downloading db_settings.dev.yaml 100.0%
      01 mkdir -p {{site.data.constants.deploy.shared_path}}config
    ✔ 01 vagrant@{{site.data.constants.deploy.host}} 0.041s
      02 rm -rf {{site.data.constants.deploy.shared_path}}config/be-admin-user-dev.sql
    ✔ 02 vagrant@{{site.data.constants.deploy.host}} 0.004s
      Uploading {{site.data.constants.deploy.shared_path}}config/be-admin-user-dev.sql 100.0%
      03 mysql --default-character-set=utf8 -u typo3 -p -h 127.0.0.1 -P 3306 typo3_cms_standard_dev -e 'source {{site.data.constants.deploy.shared_path}}config/be-admin-user-dev.sql'
      03 Enter password:
    ✔ 03 vagrant@{{site.data.constants.deploy.host}} 0.011s
    ✔ 02 vagrant@{{site.data.constants.deploy.host}} 0.003s
{% endhighlight %}
