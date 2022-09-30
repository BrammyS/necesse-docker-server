# Necesse-docker-server

Start your own dedicated Necesse server with a single command!

## Examples

```bash
docker run -d \
    -v /necesse/saves:/necesse/saves \
    -v /necesse/logs:/necesse/logs \
    -p 14159:14159/udp \
    --restart=always \
    --name necesse-server \
    brammys/necesse-server
```

## Supported tags and respective `Dockerfile` links

* [`latest`, `0.21.25` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)
* [`0.21.24` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)
* [`0.21.23` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)

## Configurations

| ENV variable    	| Default value           	| Description                                                                            	|
|-----------------	|-------------------------	|----------------------------------------------------------------------------------------	|
| None            	| None 	                    | None                                                                                     	|

## Volumes

| path       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `/necesse/saves`       	| The folder containing all the world saves.                    |
| `/necesse/logs`        	| The folder containing all the logs of the server.             |
