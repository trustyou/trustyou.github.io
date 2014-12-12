---
title: "First Dummy Post"
author: "TrustYou"
---

Hello First Dummy Post with some code

## Some code:
Some awesome code

{% highlight python %}
import select
# Poll process for new output until finished
while True:
streams, _, _ = select.select([sentency.stdout, sentency.stderr],
                             [], [])
	for stream in rstreams:
		line = stream.readline()
		logging.info("[SENTENCY:] {} ".format(line.rstrip())) 
        if  sentency.poll() != None:
		  break
 
	stdout, stderr = sentency.communicate()
	if sentency.returncode != 0:
	    raise RuntimeError()
	 
					
{% endhighlight %} 
