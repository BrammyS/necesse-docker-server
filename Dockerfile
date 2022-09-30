FROM ubuntu:22.04
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

# Misc configurations
ARG version
ARG build
ARG url
VOLUME /necesse/saves
VOLUME /necesse/cfg
VOLUME /necesse/logs
EXPOSE 14159/udp

# Update local pacakges.
RUN apt-get update --no-install-recommends

# Install wget and unzip.
RUN apt-get -y install wget
RUN apt-get -y install unzip

# Cleanup the local pacakges.
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install necesse server files.
RUN wget ${url}
RUN unzip necesse-server-linux64-${version}-${build}.zip

# Move server files to generic necesse folder.
RUN mv /necesse-server-${version}-${build} /necesse

# Moved server and word configs.
COPY ./cfg/server.cfg /necesse/cfg/server.cfg
COPY ./cfg/worldSettings.cfg /necesse/saves/world/worldSettings.cfg

# Add the correct world version to worldSettings.cfg. 
RUN sed -i s/99.99.99/${version}/g /necesse/saves/world/worldSettings.cfg

RUN chmod +x /necesse/StartServer-nogui.sh
RUN chmod -R +x /necesse/jre

WORKDIR /necesse
ENTRYPOINT [ "./jre/bin/java", "-jar", "Server.jar", "-nogui", "-localdir", "-settings", "/necesse/cfg/server.cfg" ]