---
title: "How-to Guides"
description: "TODO"
section: guides
layout: "default"
---

## Introduction

We plan to create a wide range of guides that will enable you to deploy anything from simple static website to full-blown web applications. It is essential to understand that dkdeploy is based on Capistrano, so if you want to learn more about it you should visit its  [website](http://capistranorb.com/).

### Philosophy

Dkdeploy was created to fit  our workflow. We are doing **Continous Delivery** with [Jenkins](http://www.jenkins.org) for hundreds of customers and applications. Jenkins clones the application's code from out git-repository and will pull-in all dependencies from Composer & Bundler into a build. When this succeeds it will deploy the app through our deployment pipeline across different servers. 