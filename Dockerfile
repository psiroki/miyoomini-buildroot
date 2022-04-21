FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg --add-architecture armhf && \
  apt-get -y update  \
  && apt-get -y install \
    build-essential \
	scons \
	crossbuild-essential-armhf \
	libsdl1.2-dev:armhf \
	libsdl-image1.2-dev:armhf \
	libsdl-mixer1.2-dev:armhf \
	libsdl-ttf2.0-dev:armhf \
	libpng-dev:armhf \
        libfreetype6-dev:armhf \
	nano vim git curl wget unzip cmake \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/workspace; ln -s /usr/local/include /usr/include/sdkdir
WORKDIR /root

COPY my283/include /usr/local/include/
COPY my283/include /usr/include/
COPY my283/lib /usr/lib/
COPY cross-compile-ldd /usr/bin/arm-linux-gnueabihf-ldd
COPY freetype-config /usr/bin/freetype-config
COPY setup-env.sh .
RUN cat setup-env.sh >> .bashrc

VOLUME /root/workspace
WORKDIR /root/workspace

ENV CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
ENV PREFIX=/usr
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/:/usr/local/lib/pkgconfig/
ENV CC="arm-linux-gnueabihf-gcc"
ENV CXX="arm-linux-gnueabihf-g++"

CMD ["/bin/bash"]
