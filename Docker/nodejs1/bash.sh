#! /bin/bash

docker run -it -p 5000:3000 -v logs_app:/app --name test nodeapp:v1