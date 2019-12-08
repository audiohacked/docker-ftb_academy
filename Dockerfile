# Copyright 2015-2019 Sean Nelson <audiohacked@gmail.com>
FROM openjdk:8-jre-alpine
MAINTAINER Sean Nelson <audiohacked@gmail.com>

ARG MODPACK="FTBAcademy"
ARG FTB_VERSION="1_1_0"
ARG BASE_URL="http://ftb.forgecdn.net/FTB2/modpacks/${MODPACK}"
ARG SERVER_FILE="${MODPACK}Server.zip"

WORKDIR /minecraft

USER minecraft

ADD --chown=minecraft ${BASE_URL}/${FTB_VERSION}/${SERVER_FILE} .
RUN unzip ${SERVER_FILE}
RUN chmod u+x FTBInstall.sh ServerStart.sh CheckEula.sh
RUN sed -i '2i /bin/sh /minecraft/CheckEula.sh' /minecraft/ServerStart.sh
RUN /minecraft/FTBInstall.sh
