#!/bin/bash
docker run --name "your-container-name" -d --privileged=true -p 8090:80 -v /path/to/your/www:/data:rw your-container-name