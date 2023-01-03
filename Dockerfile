FROM ubuntu:18.04
LABEL Author="Bruce Axtens <bruce.axtens@gmail.com>"
ARG ZIP_PASSWORD

RUN apt-get update && \
    apt-get install unzip jq -y && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/8th
COPY 8th.zip .
RUN unzip -P "${ZIP_PASSWORD}" 8th.zip && \
    rm 8th.zip
ENV PATH=$PATH:/opt/8th/bin/lin64

WORKDIR /opt/test-runner
COPY bin/run.sh bin/run.sh
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
