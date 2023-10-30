FROM debian:bookworm-slim

RUN apt update -y && apt install -y \
    git \
    curl 

RUN curl https://get.starkli.sh | sh &&  /root/.starkli/bin/starkliup 

ENV SHELL=/bin/bash

RUN curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh

RUN curl -L https://install.dojoengine.org | bash && /root/.dojo/bin/dojoup 