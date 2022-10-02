FROM alpine:3.16
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

# Misc configurations.
ARG version
ARG build
ARG url
EXPOSE 14159/udp
VOLUME  [                       \
    "/necesse/logs",            \
    "/necesse/saves"            \
]

# Server configs.
ENV WORLD=world
ENV SLOTS=10
ENV OWNER=""
ENV MOTD="This server is made possible by Docker!"
ENV PASSWORD=""
ENV PAUSE=0
ENV ANTI_CHEAT=0
ENV LOGGING=1
ENV ZIP=1

# Install wget and unzip and cleanup package cache.
RUN apk --update add wget unzip
RUN rm -rf /var/cache/apk/*

# Install necesse server files.
RUN wget ${url}
RUN unzip necesse-server-linux64-${version}-${build}.zip

# Move server files to generic necesse folder.
RUN mv -v /necesse-server-${version}-${build}/* /necesse/

RUN chmod -R +x /necesse/jre
WORKDIR /necesse
ENTRYPOINT ./jre/bin/java \
-jar Server.jar \
-nogui -localdir \
-world ${WORLD} \
-slots ${SLOTS} \
-owner "${OWNER}" \
-motd "${MOTD}" \
-password "${PASSWORD}" \
-pausewhenempty ${PAUSE} \
-giveclientspower ${ANTI_CHEAT} \
-logging ${LOGGING} \
-zipsaves ${ZIP}
