FROM ubuntu:25.04

ARG DOCKER_GID

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

SHELL ["/bin/bash", "-c"]

# 2) install packages
RUN apt-get update \
 && apt-get install -y \
      openjdk-17-jdk \
      openjdk-21-jdk \
      maven \
      git \
      curl \
      wget \
      tar \
      sudo \
      software-properties-common \
      tmux \
      docker.io \
      python3 \
      python3-pip \
      python3-venv \
      nodejs \
      npm \
      locales \
      vim \
      jq \ 
      pipx \
      libpq-dev \ 
      pass

RUN add-apt-repository -y ppa:neovim-ppa/unstable \     
 && apt-get update \
 && apt-get install -y neovim 

RUN groupadd -g "${DOCKER_GID}" docker-host \
 && usermod -aG docker-host ubuntu \
 && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8

RUN npm install -g mcp-hub@latest

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN pipx install pgcli

CMD ["bash"]

