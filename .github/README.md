# Necesse-docker-server

Start your own dedicated Necesse server with a **single** command!

## Examples

### New world

The following command creates a server with `strong_pass` for the password.
And it also generates a new world.

```bash
docker run -d \
    -v /necesse/saves:/necesse/saves \
    -p 14159:14159/udp \
    -e PASSWORD=strong_pass \
    -e PAUSE=1 \
    --restart=always \
    --name necesse-server \
    brammys/necesse-server
```

### Existing world

First move your existing `WORLD_NAME` file to the `/necesse/saves` directory.
Use the following command to start your server with your provided world.
Be sure to replace `WORLD_NAME` with your actual world name.

```bash
docker run -d \
    -v /necesse/saves:/necesse/saves \
    -p 14159:14159/udp \
    -e PASSWORD=strong_pass \
    -e PAUSE=1 \
    -e WORLD=WORLD_NAME \
    --restart=always \
    --name necesse-server \
    brammys/necesse-server
```

### Docker-compose

You can also use the provided [docker-compose.yaml](https://github.com/BrammyS/necesse-docker-server/blob/main/docker-compose.yaml) file.
Use the following command to start your dedicated server with docker-compose.

```bash
docker-compose up -d
```

## Supported tags

All suported tags can be found on [dockerhub](https://hub.docker.com/r/brammys/necesse-server/tags).

## Configurations

### Environment variables

| ENV variable    	    | Default value           	                    | Description                                                                            	                                             |
|-------------------	|-------------------------------------------	|------------------------------------------------------------------------------------------------------------------------------------    |
| `WORLD`            	| `world` 	                                    | The name of the world that will be used.                                                                                               |
| `SLOTS`            	| `10` 	                                        | The Amount of player slots.                                                                                                            |
| `OWNER`            	| `` 	                                        | Anyone that connects with this name, will get owner permissions.                                                                       |
| `MOTD`            	| `"This server is made possible by Docker!"`   | Sets the message of the day. Use \n for new line.                                                                                      |
| `PASSWORD`            | `` 	                                        | The password for the server, blank for no password.                                                                                    |
| `GIVE_CLIENTS_POWER`  | `1` 	                                        | If the server should check client actions, a kind of anti-cheat. When this setting is on it will give a much smoother experience for clients. (`0` off, `1` on)                    |
| `PAUSE`            	| `0` 	                                        | Pauses the world when there are no players in server. (`0` off, `1` on)                                                                |
| `LOGGING`            	| `1` 	                                        | Generate a log file for each session. (`0` off, `1` on)                                                                                |
| `ZIP`            	    | `1` 	                                        | Whether saves should be compressed. (`0` off, `1` on)                                                                                  |
| `JVMARGS`            	| `` 	                                        | Any extra arguments to supply to the JVM via the [java command](https://docs.oracle.com/en/java/javase/17/docs/specs/man/java.html).   |

### Volumes

| Path       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `/necesse/saves`       	| The folder containing all the world saves.                    |
| `/necesse/logs`        	| The folder containing all the logs of the server.             |

### Ports

| Port       	            | Description                                                   |
|---------------------------|-----------------------------------------------------------    |
| `14159/udp`       	    | The game runs on UDP port `14159`.                            |
