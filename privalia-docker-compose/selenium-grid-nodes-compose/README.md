# selenium-grid-nodes-compose

 This is a docker-compose file that starts the necessary containers for using selenium-grid and perform
 selenium-related tests

 In order to use it, you have to:

 - Have docker/docker-compose installed on your system 
 - Have access to privalia's internal docker repository (check [here](http://confluence.privalia.pin/display/DEV/Privalia+Docker+Register)
   for more information)


Clone the repo (or just download the YAML file) and execute a docker-compose up on the *.yml file

```sh
$ git clone git@github.com:PrivaliaTech/tools-qa.git
$ cd tools-qa/privalia-docker-compose/selenium-grid-nodes-compose
$ docker-compose -f selenium-grid-nodes-compose.yml up -d
```

 All services will be available via localhost, and all will have port binding to a local port in the
 machine. The ports that will be used for binding are:

 * 4444 (Selenium hub)
 * 5900 (Selenium node chrome)
 * 5901 (Selenium node firefox)
 
 So, make sure this ports are available in the host machine. Now you can head to http://localhost:4444/grid/console  to see the Selenium grid console up and the nodes connected. 

To execute a test:

```sh
 $ mvn clean verify -Dit.test=com.privalia.myproject.mypackage.CucumberSeleniumIT -DSELENIUM_GRID=localhost:4444
```

 The tests will be executed in all available browsers. You can also use the option -DFORCE_BROWSER to force the execution of tests in a particular browser, for example: 

  -DFORCE_BROWSER=firefox_60.0 		//To execute tests only if firefox browser
  -DFORCE_BROWSER=chrome_chrome  //To execute tests only in chrome browser

 

## How do I see my tests running?

 On MacOSX you can open the Screen Sharing app and connect to the chrome node with the address localhost:5900 (or to the firefox node with localhost:5901). When prompted for a password, just type: "secret"
 
 On linux, you can install the package vncviewer and type in the terminal: 

```sh
$ vncviewer localhost:5900 
```

 (when prompted for a password, just type: "secret"). You can also install a graphical tool such as remote
 desktop client and proceed much like in OSX


## Stopping services

 To terminate all services just execute in the terminal (in the same folder where this file is located)

```sh
 $ docker-compose -f selenium-grid-nodes-compose.yml down
```
