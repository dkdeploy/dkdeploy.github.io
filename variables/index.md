---
title: Variables
section: variables
layout: wide
---

### How-To

Most **dkdeploy** tasks can be customized. You can set variables the following ways (example here: task `db:dump_table`):

1. Either set the variable `dump_table` in your deploy.rb (recommended for most settings):

{% highlight ruby %}
set :dump_table, "dumpable_table_name"
{% endhighlight %}

2. Or supply them on the command line - separated by comma - when invoking Capistrano (recommended for manual deployments)

{% highlight ruby %}
cap {{site.data.constants.deploy.stage}} db:dump_table "dump_table[dumpable_table_name]"
{% endhighlight %}

3. We recommend for automated deployments setting a capistalized environment variable like:

{% highlight ruby %}
DUMPABLE_TABLE_NAME=dumpable_table_name cap {{site.data.constants.deploy.stage}} db:dump_table
{% endhighlight %}

If none of the above is true, most tasks will fall back to a text dialogue (understandably not very useful for automated deployments).

### List of variables

|**Variable Name** (as symbol)|**Type**|**Default Value**|**Description**|
|`:scm`|Symbol|`:copy`|Capistrano Source Control System. Possible Values: `:git`, `:hg`, `:svn`, `:copy`|
|`:copy_source`|String|`'htdocs'`|Directory, which gets copied onto target server. Example: `'.'`, `'htdocs'`, `'htdocs/sub_dir'`. *Note:* This configuration is only required for the copy strategy  (`:copy`).|
|`:copy_exclude`|Array|`['vendor/bundle/**', 'Gemfile*', 'build', '.git', '.svn', '**/.svn', '.DS_Store', '**/.DS_Store', '.settings', '.project', '.buildpath', 'Capfile', 'config', 'Thumbs.db', 'composer.*']`|List of files and directories (within `:copy_source` in glob notation) which won't be deployed.<br/>*Note:* This configuration is only required for the copy strategy (`:copy`).|
|`:rsync_roles`|Array|`:app`|For this role `rsync` will be executed.|
|`:rsync_exclude`|Array|`[]`|List of file which will be excluded when running `rsync`. This corresponds to the `exclude` option of `rsync`.|
|`:rsync_path`|String|Configuration of `:copy_source`|Directory to be used with `rsync`.|
|`:compass_sources`|Array|`[]`|Stylesheets directory<br/>*Example:* `['htdocs/domain1/stylesheets', 'htdocs/domain2/stylesheets']`<br/>*Note:* all Compass directories musst have a `config.rb` file!|
|`:default_file_access_owner`|String|`'dkd-deployment'`|Default owner of files and directory.|
|`:default_file_access_group`|String|`'www-data'`|Default group of files and directory.|
|`:default_file_access_mode`|String|`'u+rwX,g+rX,g-w,o-rwx'`|Default file and direcory permissions.|
|`:asset_folders`|Array|`[]`|Folders to upload and download for all `assets` tasks.|
|`:asset_default_content`|Array|`[]`|List of tar.gz archives, which include database preseed.|
|`:local_web_root_path`|String|`./`|Your local web root path.|
|`:asset_exclude_file`|String||Name of file which contains a list of excluded files for `download` task.|
|`:enhanced_linked_files`|Hash|`{}`|List of files which will be linked from `shared_path` to `release_path`. In contrast to symlink related tasks by Capistrano this allows you to inlcude other files and directory in `shared_path` und `release_path`. All symlink related task by Capistrano are still run. `dkdeploy` runs after the related Capistrano task.<br/>*Example*<br/><code class="ruby">{ 'demo/file1' => 'sample/demo/test0815' }</code> links the file `demo/file1` in `shared_path` to `sample/demo/test0815` in `release_path`.|
|`:enhanced_linked_dirs`|Hash|`{}`|List of directories, which get linked from `shared_path` to `release_path`. In contrast to symlink related tasks by Capistrano this allows you to inlcude other files and directory in `shared_path` und `release_path`. All symlink related task by Capistrano are still run. `dkdeploy` runs after the related Capistrano task.<br/>Example:<br/><code class="ruby">{ 'demo' => 'sample' }</code> links the directory `demo` in `shared_path` to `sample` in `release_path`.|
|`:custom_file_access`|Hash|`{}`|Custom File Permissions (see complex sample below)|
|`:bower_path`|String|Fetched from `:copy_source` variable|Directory to be used with `bower`|
|`:bower_paths`|String|Fetched as an array from `:copy_source` variable|Directories to be used with `bower` and the `run_all` task. Note: do not write multiple directories in `:copy_source` variable|

### Sample for `customer_file_access`

{% highlight ruby %}
set :custom_file_access, {
  role_x: {
    release_path: {
      directory_name: {
        owner: '{{site.data.constants.deploy.user}}',  #optional
        group: '{{site.data.constants.deploy.group}}', #optional
        mode: 'a+rwx,o-wx',  #optional
        recursive: true      #optional
      },
      'file name with spaces': => {
        group: '{{site.data.constants.deploy.group_alternate}}'
      }
    },
    shared_path: {
      file_name: {
        owner: '{{site.data.constants.deploy.user}}'
      }
    }
  }
}
{% endhighlight %}
