FROM debian
RUN apt update
RUN apt install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm

ENV GOSU_VERSION 1.10

RUN set -ex; \
	fetchDeps='ca-certificates wget'; \
	apt-get update; \
	apt-get install -y --no-install-recommends $fetchDeps; \
	rm -rf /var/lib/apt/lists/*; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	chmod +x /usr/local/bin/gosu

RUN apt update
RUN apt install -y wget
RUN apt install -y locales

# set locale
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8 
ENV LANGUAGE en_US:en

RUN sed -i '/^#.* en_US.* /s/^#//' /etc/locale.gen
RUN locale-gen

ADD layers /data/layers
ADD tools /data/tools

RUN mkdir /data/workspace
WORKDIR /data/workspace
ADD entrypoint.sh /data/entrypoint.sh
ADD start.sh /data/start.sh
ENTRYPOINT ["/data/entrypoint.sh"]
CMD ["bitbake-layers", "show-layers"]
