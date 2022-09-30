FROM ubuntu:22.04
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

# Misc configurations
ARG version
ARG build
VOLUME /root/.config/Necesse
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
RUN wget https://necessegame.com/wp-content/uploads/2022/09/necesse-server-linux64-${version}-${build}.zip
RUN unzip necesse-server-linux64-${version}-${build}.zip

# Move server files to the correct folder.
RUN mv /necesse-server-${version}-${build} /necesse-server

# Moved server and word configs.
COPY ./cfg/server.cfg /root/.config/Necesse/cfg/server.cfg
COPY ./cfg/worldSettings.cfg /root/.config/Necesse/saves/world/worldSettings.cfg

# Add the correct world version to worldSettings.cfg. 
RUN sed -i s/99.99.99/${version}/g /root/.config/Necesse/saves/world/worldSettings.cfg

RUN chmod +x /necesse-server/StartServer-nogui.sh
RUN chmod -R +x /necesse-server/jre
ENTRYPOINT ["/necesse-server/StartServer-nogui.sh"]