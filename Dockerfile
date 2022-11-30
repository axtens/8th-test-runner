FROM ubuntu:18.04
LABEL Author="Bruce Axtens <bruce.axtens@gmail.com>"

RUN apt-get update && \
    apt-get install unzip jq -y && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
WORKDIR /opt/8th
COPY 8th.zip .
RUN unzip 8th.zip && \
    rm 8th.zip

ENV PATH=$PATH:/opt/8th/bin/lin64

ENTRYPOINT [ "8th" ]
