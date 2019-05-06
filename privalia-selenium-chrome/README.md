Privalia Selenium-Chrome Image
=============================

* Based on Ubuntu 16.04
* Selenium Server Standalone 3.9.1-actinium
* Chromedriver 2.33
* Chrome version: 64.0.3282.140
* OpenJDK 1.8
* Fluxbox 1.3.5
* x11vnc: 0.9.13

## How to build it?

``` bash
$ git clone git@github.com:PrivaliaTech/tools-qa.git
$ cd tools-qa
$ cd docker-selenium-chrome
$ docker build -t privalia-selenium-chrome:64 . 
```

## How to run it?

``` bash
$ docker run -d -P --name mybrowser -e ID=mybrowser -e SELENIUM_GRID=<hub-address>:<hub-port> --dns <dns-address> privaliatech/privalia-selenium-chrome:62
```

## How to extend it?

In your Dockerfile include the next line
```FROM privaliatech/privalia-selenium-chrome:62```

## Enviroment Variables

### ID
This variable is mandatory and specifies the unique identificator of the browser.
Ex. "ID=privalia"

### SELENIUM_GRID
This variable is mandatory and it is used to indicated a specific grid.
Ex. "SELENIUM_GRID=jenkins.privalia.com:4444"

## Connecting to the node
You can acquire the port that the VNC server is exposed to by running:

``` bash
$ docker port <container-name|container-id> 5900
#=> 0.0.0.0:49338
```

Using RealVNC you can look in view only mode.

``` bash
$ vncviewer 127.0.0.1:49338
```

When you are prompted for the password it is __secret__.
