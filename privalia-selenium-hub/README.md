Privalia Selenium Grid Hub Image
=============================

* Based on Ubuntu 16.04
* Selenium Server Standalone 3.9.1-actinium

The Hub receives a test to be executed along with information on which browser and 'platform' where the test should be run. The hub will use this information and delegate to a node that can service those needs.

## How to use this image

Download and build the image
``` bash
$ git clone git@github.com:PrivaliaTech/tools-qa.git
$ cd tools-qa
$ cd privalia-selenium-hub
$ docker build -t privalia-selenium-hub:3.9.1 .
```

Run the container
```
$ docker run -d -p 4444:4444 --name selenium-hub privaliatech/privalia-selenium-hub
```

Note: You can optionally override default configuration settings using environment variables.

```
$ docker run -d -P --name selenium-hub -e GRID_TIMEOUT=10 privaliatech/privalia-selenium-hub
