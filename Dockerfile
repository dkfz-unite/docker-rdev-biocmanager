FROM ubuntu:latest AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y r-base r-base-dev && \
    apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM base AS install
COPY ./src /src
WORKDIR /src
RUN Rscript install.R && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
