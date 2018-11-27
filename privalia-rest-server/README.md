Privalia Rest-Server Image
=============================

* Based on Debian Jessie
* NodeJS 9.11.1
* json-server as mock server (0.14.0)

## How to build it?

``` bash
$ git clone git@gitlab.privalia.pin:qa-automation/tools-qa.git
$ cd tools-qa
$ cd privalia-rest-server
$ docker build -t privalia-rest-server:0.1.0 . 
```

## How to run it?

``` bash
$ docker run -d -p 3000:3000 --name rest-server privalia-rest-server:0.1.0
```
Now the server should be available in localhost:3000

## How to extend it?

In your Dockerfile include the next line
```FROM privalia-rest-server:0.1.0```

## Description

json-server is a fake rest server that serves mock data. It is useful for testing rest clients (such as bdt-lib library). You can find more information in github (https://github.com/typicode/json-server), or you can try a live version of the server (https://jsonplaceholder.typicode.com/)

### Resources
``` bash
/posts
/comments
/albums
/photos
/todos
/users
```

### Routes examples
``` bash
GET	/posts
GET	/posts/1
GET	/posts/1/comments
GET	/comments?postId=1
GET	/posts?userId=1
POST	/posts
PUT	/posts/1
PATCH	/posts/1
DELETE	/posts/1
```

### Sample data
The server uses a seed file (db.json) with the initial contents of the database. This file is automatically saved within the container during build and used once the server is started.