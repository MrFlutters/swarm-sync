#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

ARG DOCKER_BASE_TYPE=stretch-slim
ARG NODEJS_VERSION=12.2.0
ARG DOCKER_IMAGE=node:${NODEJS_VERSION}-${DOCKER_BASE_TYPE}

FROM ${DOCKER_IMAGE}

ARG USERNAME=node

# RUN useradd -u 1000 -g 1000 -m $USERNAME
ENV HOME /home/$USERNAME

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# RUN apt-get install -y sudo \
#     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

# Verify git and needed tools are installed
RUN apt-get install -y git procps build-essential python

# Remove outdated yarn from /opt and install via package 
# so it can be easily updated via apt-get upgrade yarn
# RUN rm -rf /opt/yarn-* \
#     && rm -f /usr/local/bin/yarn \
#     && rm -f /usr/local/bin/yarnpkg \
#     && apt-get install -y curl apt-transport-https lsb-release \
#     && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
#     && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#     && apt-get update \
#     && apt-get -y install --no-install-recommends yarn

# Install eslint
# RUN npm install -g eslint

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

USER $USERNAME

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash