Privalia QA Worker Image
=============================

* Alpine linux
* Java JDK 8
* Maven 3.5.2
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

Go to the project directory (where the pom.xml file is located), and execute:


``` bash
docker run -it --rm -- SeleniumPoolingIT -v maven-repo:/root/.m2 -v $(pwd):/usr/src/mymaven --workdir /usr/src/mymaven privalia-qa-worker:0.1.0 mvn verify -Dit.test=com.privalia.bo.po.SeleniumPoolingIT.java -DSELENIUM_GRID=127.0.0.1:4444 -DlogLevel=DEBUG
```

Change the test name or other variables (like the address of the selenium grid or the loggin level) according to your needs
