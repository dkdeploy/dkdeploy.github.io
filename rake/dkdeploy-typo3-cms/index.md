---
layout: default
title: "dkdeploy-typo3-cms gem"
categories: "dkdeploy-typo3-cms"
section: "rake"
---


## Setup Tasks

{% highlight shell-session %}
cap ${STAGE} db:upload_settings["${DATABASE_HOST},${DATABASE_PORT},${DATABASE_NAME},${DATABASE_USERNAME},${DATABASE_PASSWORD},'utf8'"];
cap ${STAGE} typo3:cms:create_db_credentials;
cap ${STAGE} db:add_default_structure;
cap ${STAGE} db:add_default_content;
cap ${STAGE} assets:cleanup;
cap ${STAGE} assets:add_default_content;
ENCRYPTION_KEY=`cap ${STAGE} typo3:cms:generate_encryption_key`
cap ${STAGE} typo3:cms:create_encryption_key_file["${ENCRYPTION_KEY}"];
cap ${STAGE} typo3:cms:create_install_tool_password_file["${INSTALL_PASSWORD}"];
{% endhighlight %}

## What is it good for?

**dkdeploy-typo3-cms** provides additional functionality for deployments targeting typo3 applications:
like..

* Install Tool
* Run TYPO3 CLI tasks
* generate encryption key
* add admin user
* clear file cache
