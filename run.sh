#/bin/bash 
docker run -it -e PASSWORD=hotoku -v /Users/hotoku/sample/r:/home/rstudio -p 8787:8787 hotoku/r

