FROM alpine:3

LABEL maintainer="BrammyS <https://github.com/BrammyS>"
LABEL org.label-schema.name="brammys/necesse-server"
LABEL org.label-schema.description="A Docker image for a dedicated Necesse game server."
LABEL org.label-schema.vendor="BrammyS"
LABEL org.label-schema.url="https://github.com/BrammyS/necesse-docker-server"
LABEL org.label-schema.docker.cmd="docker run -d -v /necesse/saves:/necesse/saves -p 14159:14159/udp -e PASSWORD=strong_pass -e PAUSE=1 --restart=always --name necesse-server brammys/necesse-server"

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
ENV GIVE_CLIENTS_POWER=0
ENV LOGGING=1
ENV ZIP=1

# Install java, wget and unzip and cleanup package cache.
RUN apk --update add wget unzip 
RUN apk add openjdk8 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN rm -rf /var/cache/apk/*

# Install necesse server files.
RUN wget ${url}
RUN unzip necesse-server-linux64-${version}-${build}.zip

# Move server files to generic necesse folder.
ARG dir=necesse-server-${version}-${build}
RUN rm -rf ${dir}/jre
RUN mv -v ${dir}/* /necesse/
RUN rm -rf ${dir}

WORKDIR /necesse
ENTRYPOINT java \
-jar Server.jar \
-nogui -localdir \
-world ${WORLD} \
-slots ${SLOTS} \
-owner "${OWNER}" \
-motd "${MOTD}" \
-password "${PASSWORD}" \
-pausewhenempty ${PAUSE} \
-giveclientspower ${GIVE_CLIENTS_POWER} \
-logging ${LOGGING} \
-zipsaves ${ZIP}
