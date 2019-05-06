Privalia QA Worker Image
=============================

* Alpine linux
* Java JDK 8
* Maven 3.5.4
* Includes vin, openssh-client, iputils

## How to build it?

``` bash
$ git clone git@gitlab.privalia.pin:som-qa/tools-qa.git
$ cd tools-qa
$ cd privalia-qa-worker
$ docker build -t privalia-qa-worker:0.1.0 . 
```

## How to use this image

To avoid using the maven .m2 repository in the local host, first create a volume 

``` bash
$ docker volume create --name maven-repo
```

Then, you can map this new volume to the .m2 directory of the container using -v maven-repo:/root/.m2


## How to run it?

You can go to your project folder and execute your tests:

``` bash
cd .../pilot-project
docker run -it --rm --name SeleniumPoolingIT --dns 172.16.214.1 --dns 172.16.214.2 -v maven-repo:/root/.m2 -v $(pwd):/usr/src/mymaven --workdir /usr/src/mymaven privaliatech/privalia-qa-worker:0.1.0 mvn verify -Dit.test=com.privalia.bo.po.SeleniumPoolingIT.java -DSELENIUM_GRID=172.17.0.1:4444 -DlogLevel=DEBUG
```

Change the test name or other variables (like the address of the selenium grid or the loggin level) according to your needs.

The container is designed to stop and delete itself once the execution of the maven command ends. To avoid this and keep the container alive, you can run the container in the following way:

``` bash
cd .../pilot-project
docker run -it --rm -e KEEP_ALIVE=1 --name SeleniumPoolingIT --dns 172.16.214.1 --dns 172.16.214.2 -v maven-repo:/root/.m2 -v $(pwd):/usr/src/mymaven --workdir /usr/src/mymaven privaliatech/privalia-qa-worker:0.1.0 mvn verify -Dit.test=com.privalia.bo.po.SeleniumPoolingIT.java -DSELENIUM_GRID=172.17.0.1:4444 -DlogLevel=DEBUG
```

KEEP_ALIVE= If 1, keeps the container alive after the maven command finish its execution. If not specified, defaults to 0

