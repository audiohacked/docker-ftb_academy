# Copyright 2015-2019 Sean Nelson <audiohacked@gmail.com>
FROM audiohacked/ftb_base:latest
LABEL maintainer="audiohacked@gmail.com"

ARG MODPACK="FTBAcademy"
ARG FTB_VERSION="1_1_0"
ARG SERVER_FILE="${MODPACK}Server.zip"
# ARG BASE_URL="https://ftb.forgecdn.net/FTB2/modpacks/${MODPACK}"

WORKDIR /minecraft

USER minecraft

RUN wget ${BASE_URL}/${MODPACK}/${FTB_VERSION}/${SERVER_FILE} \
    && unzip ${SERVER_FILE} \
    && rm ${SERVER_FILE}
RUN chmod u+x FTBInstall.sh ServerStart.sh
RUN sed -i '2i /bin/sh /minecraft/CheckEula.sh' /minecraft/ServerStart.sh
RUN /minecraft/FTBInstall.sh
