---
title: "namespace fail"
description: "Internal raise condition."
section: "rake"
layout: default
---

## fail

Raises internal failure condition.

#### Usage

Use this function within your own ruby tasks to raise errors during the execution.

{% highlight shell %}
desc 'run_unit_tests'
   task :run_unit_tests do
   fail 'not implemented'
end
{% endhighlight %}


#### Output

The output will be the provided errors.<br/>
The deployment will be aborted.