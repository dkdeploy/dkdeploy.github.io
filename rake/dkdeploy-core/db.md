---
title: "namespace db"
description: "This is about databases"
section: "rake"
layout: default
---

The namespace _db_ offers tasks to handle the database configuration, structure and content.

## add_default_content

Add default content from **config/preseed/default_content.sql.gz** to database

### Usage

Used for initial setup of the project.
This requires an existing database configuration (see [upload_settings](#uploadsettings)).

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:add_default_content
{% endhighlight %}

## add_default_structure

Add structure content from **config/preseed/default_structure.sql.gz** to database

### Usage

Used for initial setup of the project.
This requires an existing database configuration (see [upload_settings](#uploadsettings)).

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:add_default_structure
{% endhighlight %}

### Output

{% highlight shell %}
00:00 db:add_default_structure
      Downloading db_settings.dev.yaml 100.0%
      01 rm -f /var/www/typo3-cms-standard/htdocs/default_structure.sql
    ✔ 01 vagrant@192.168.156.14 0.043s
      02 rm -f /var/www/typo3-cms-standard/htdocs/default_structure.sql.gz
    ✔ 02 vagrant@192.168.156.14 0.005s
      Uploading config/preseed/default_structure.sql.gz 100.0%
      03 gunzip /var/www/typo3-cms-standard/htdocs/default_structure.sql.gz
    ✔ 03 vagrant@192.168.156.14 0.005s
      04 mysql --default-character-set=utf8 -u typo3 -p -h 127.0.0.1 -P 3306 typo3_cms_standard_dev -e 'source /var/www/typo3-cms-standard/htdocs/default_structure.sql'
      04 Enter password:
    ✔ 04 vagrant@{{site.data.constants.deploy.host}} 0.109s
    ✔ 01 vagrant@{{site.data.constants.deploy.host}} 0.004s
    ✔ 02 vagrant@{{site.data.constants.deploy.host}} 0.004s
{% endhighlight %}

## console

Run interactive MySQL console.

### Usage

This function requires an existing configuration file on the target stage.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:console
{% endhighlight %}
    
<div class="callout warning">
This task raises an error if the connection could not be established.
</div>

## download

Dump complete database without cache table content to local temp folder.
Triggers the task [downloadstructure](#downloadstructure) and [download_content](#downloadcontent).

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:download
{% endhighlight %}

## download_content

Dump complete database content without cache tables and structure to local temp folder

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:download_content
{% endhighlight %}

## download_structure

Dumps complete database structure without content

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:download_structure
{% endhighlight %}

## download_tables

Download database tables.

### Usage

This task offers three parameters `:file_path`, `:file_name` and `:table_names`.
 
The variable `file_path` defines the path where you want to download the database dump. Default value is _temp_.
The variable `:file_name` defines the name of the file where the download is stored.

The tables to be dumped are set with `:table_names` as a comma separated list of table names.

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:download_tables[file_path,file_name,table_names]
{% endhighlight %}

## dump_table

Dump content of a database table to local  folder

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:dump_table[table_name]
{% endhighlight %}

## dump_tables

Dump content of a list of database tables to a local folder.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:dump_tables[file_path,file_name,table_names]
{% endhighlight %}

## update

Upload, unzip and execute database script.

### Configuration

This task requires the path to the database dump and the filename to be uploaded.

The file has to be compressed by gzip.

<div class="callout warning">
This task raises an error if the local database dump does not exists. <br />
This task raises an error if the database dump could not be imported.
</div>


### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:update[file_path,zipped_db_file]
{% endhighlight %}

## upload_settings

Upload database settings file. An existing configuration file will be deleted. 

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:upload_settings[db_host,db_port,db_name,db_username,db_password,db_charset]
{% endhighlight %}

<div class="callout alert">
This task raises an error if the given password is empty.<br />
This task raises an error if the given credentials are not valid.
</div>

## read_db_settings

Load the database configuration from the given stage.

### Configuration

This tasks requires an existing database configuration file on the target stage.

The filename containing the configuration starts with _db_settings._, the name of the stage.
The filename ends with _.yaml_

#### Example

{% highlight shell %}
db_settings.{{site.data.constants.deploy.stage}}.yaml
{% endhighlight %}

There are no variables that need to be configured.

#### Usage

This task is used internally when

* Database content or structure is downloaded
* Doctrine migrations are executed

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:read_db_settings
{% endhighlight %}

<div class="callout warning">
This task raises an error if the configuration file does not exists on the target stage.
</div>

#### Output

There is no output on the screen.
The Yaml file is available in the temp directory.

Example for a db_settings file:
{% highlight yml %}
---
database:
  host: {{site.data.constants.mysql.host}}
  port: '{{site.data.constants.mysql.port}}'
  name: {{site.data.constants.mysql.database}}
  username: {{site.data.constants.mysql.username}}
  password: {{site.data.constants.mysql.password}}
  charset: {{site.data.constants.mysql.charset}}

{% endhighlight %}


## upload_tables

This task update database tables. Additional a MD5 hash is generated and stored on the server.
If this task is executed again with the same file the MD5 hash is used to check if an updated is required.

### Usage

{% highlight shell %}
$ cap {{site.data.constants.deploy.stage}} db:upload_tables[file_path,file_name]
{% endhighlight %} 