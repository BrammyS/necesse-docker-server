# Necesse-docker-server

Start your own dedicated Necesse server with a single command!

## Examples

```bash
docker run -d \
    -v /necesse/saves:/necesse/saves \
    -v /necesse/logs:/necesse/logs \
    -p 14159:14159/udp \
    -e PASSWORD=strong_pass \
    -e PAUSE=1 \
    --restart=always \
    --name necesse-server \
    brammys/necesse-server
```

## Supported tags and respective `Dockerfile` links

* [`latest`, `0.21.25` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)
* [`0.21.24` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)
* [`0.21.23` (Dockerfile)](https://github.com/BrammyS/necesse-docker-server/blob/main/Dockerfile)

## Configurations

### Environment variables

| ENV variable    	| Default value           	| Description                                                                            	                                                    |
|-----------------	|-------------------------	|---------------------------------------------------------------------------------------------------------------------------------------------  |
| `WORLD`            	| `world` 	                                    | The name of the world that will be used.                                                                              |
| `SLOTS`            	| `10` 	                                        | The Amount of player slots.                                                                                           |
| `OWNER`            	| `` 	                                        | Anyone that connects with this name, will get owner permissions.                                                      |
| `MOTD`            	| `"This server is made possible by Docker!"`   | Sets the message of the day. Use \n for new line.                                                                     |
| `PASSWORD`            | `` 	                                        | The password for the server, blank for no password.                                                                   |
| `ANTI_CHEAT`          | `0` 	                                        | Whether the server should check clients action. Experience will be much smoother when turned off. (`0` off, `1` on)   |
| `PAUSE`            	| `0` 	                                        | Pauses the world when there are no players in server. (`0` off, `1` on)                                               |
| `LOGGING`            	| `1` 	                                        | Generate a log file for each session. (`0` off, `1` on)                                                               |
| `ZIP`            	    | `1` 	                                        | Wether saves should be compressed. (`0` off, `1` on)                                                                  |

### Volumes

| Path       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `/necesse/saves`       	| The folder containing all the world saves.                    |
| `/necesse/logs`        	| The folder containing all the logs of the server.             |

### Ports

| Port       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `14159/udp`       	    | The game runs on UDP port `14159`.                            |
