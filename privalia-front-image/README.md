Privalia Rest-Front Image
=============================

* Based on nginx:alpine
* Static site from http://demoqa.com/

## How to build it?

``` bash
$ git clone git@gitlab.privalia.pin:qa-automation/tools-qa.git
$ cd tools-qa
$ cd privalia-front-image
$ docker build -t privalia-front-image:0.1.0 . 
```

## How to run it?

``` bash
$ docker run -d -p 80:80 --name demoqa privalia-front-image:0.1.0
```
Now the server should be available in localhost:80

## How to extend it?

In your Dockerfile include the next line
```FROM privalia-front-image:0.1.0```

## Description

This images starts an static web page that can be used to run tests related to selenium in the bdt-lib library. It is used to tests the implementation of selenium in the cucumber steps, it does not contain client-specific login.
This web page is based on the live site http://demoqa.com/