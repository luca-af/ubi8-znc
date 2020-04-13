ARG TAG="znc-1.7.5"

# In this stage we will make a build of znc
FROM registry.access.redhat.com/ubi8/ubi-minimal AS build-stage

RUN microdnf update && microdnf install make
RUN microdnf install gcc-c++ which pkg-config python3 tar gzip automake gcc cmake git
RUN git clone https://github.com/znc/znc.git && cd /znc && git fetch origin ${TAG} && git checkout ${TAG} && git submodule update --init --recursive \
    && ./autogen.sh && mkdir /znc/build && cd /znc/build && ../configure && make

# Build the real container

FROM registry.access.redhat.com/ubi8/ubi-minimal  

LABEL maintainer="elroncio@gmx.ca"

RUN microdnf update && microdnf install findutils
COPY --from=build-stage /znc /znc
ADD install.sh /znc/build/install.sh
RUN cd /znc/build && ./install.sh

ARG PATH_ZNC_HOME="/home/znc"
ARG UID="1001"

RUN mkdir -p ${PATH_ZNC_HOME}/.znc/
RUN chown -R ${UID}:${UID} ${PATH_ZNC_HOME}

# Do some cleanup

RUN cd / && rm -rf /znc && microdnf remove findutils

VOLUME ${PATH_ZNC_HOME}

USER ${UID}
WORKDIR ${PATH_ZNC_HOME}

ENTRYPOINT ["znc", "--foreground"]
