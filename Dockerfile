FROM ubuntu:22.04
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

# Misc configurations
ARG version
ARG build
ARG url
EXPOSE 14159/udp
VOLUME  [                               \
            "/necesse/cfg/server.cfg",  \ 
            "/necesse/logs",            \
            "/necesse/saves"            \
        ]

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
RUN mv -v /necesse-server-${version}-${build}/* /necesse/

COPY ./cfg/server.cfg /necesse/cfg/server.cfg
RUN chmod -R +x /necesse/jre
WORKDIR /necesse
ENTRYPOINT [ "./jre/bin/java", "-jar", "Server.jar", "-nogui", "-localdir" ]