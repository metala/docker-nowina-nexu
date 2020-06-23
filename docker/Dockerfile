FROM ubuntu:16.04
LABEL maintainer="Marin Ivanov <dev@metala.org>"

RUN apt-get update \
    && apt-get -y install \
        pcscd \
        pcsc-tools \
        libacsccid1 \
        libccid \
        libpcsclite1 \
        libseccomp2 \
				libxtst6 \
				zlib1g \
        libboost-system1.58.0 \
        libboost-filesystem1.58.0 \
        libboost-serialization1.58.0 \
        libboost-thread1.58.0 \
        sudo \
				wget \
				unzip \
				socat \
				libglib2.0-bin \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 user \
    && useradd -d /home/user -s /bin/bash -m user -u 1000 -g 1000

ADD jre-8u261-linux-x64.tar.gz /opt/java

COPY nexu-bundle-1.22.zip /tmp/
WORKDIR /opt/nexu
RUN unzip /tmp/nexu-bundle-1.22.zip \
    && rm /tmp/*.zip

ENV JAVA_HOME=/opt/java/jre1.8.0_261
RUN ln -s /opt/java/jre1.8.0_261/bin/java /usr/local/bin/java
COPY ./entrypoint.sh /usr/local/bin/
WORKDIR /opt/nexu/nexu-bundle-1.22
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nexu"]

