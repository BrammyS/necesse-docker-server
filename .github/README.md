# Necesse-docker-server

Start your own dedicated Necesse server with a single command!

## Examples

```bash
docker run -p 14159:14159 --name necesse-server brammys/necesse-server
```

## Supported tags and respective `Dockerfile` links

* [`latest`, `0.21.25` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)

## Configurations

| ENV variable    	| Default value           	| Description                                                                            	|
|-----------------	|-------------------------	|----------------------------------------------------------------------------------------	|
| None            	| None 	                    | None                                                                                     	|

## Volumes

| path       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `/root/.config/Necesse` 	| The folder containing all the server data for Necesse.        |

