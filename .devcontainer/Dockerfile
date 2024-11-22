FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV LANG C.UTF-8
ARG INSTALL_ZSH="true"

RUN apt-get update

RUN apt-get -y install git cmake libtool-dev libx11-dev libxrender-dev libx11-dev libcairo-dev tcl-dev tk-dev bison flex libxpm-dev m4 mesa-common-dev libgl-dev libglu1-mesa-dev zlib1g-dev libncurses-dev 

RUN mkdir /tools

#Install magic from source
RUN cd /tools && git clone https://github.com/RTimothyEdwards/magic.git magic_src && cd magic_src && ./configure --prefix=/tools/magic && make -j && make install

#INSTALL xschem
RUN cd /tools && git clone https://github.com/StefanSchippers/xschem.git xschem-src && cd xschem-src && ./configure --prefix=/tools/xschem && make -j && make install

#ngspice install
RUN cd /tools && git clone git://git.code.sf.net/p/ngspice/ngspice spice && cd spice && mkdir -p build && ./autogen.sh && cd build &&  ../configure --prefix=/tools/ngspice --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp --enable-osdi && make -j && make install

#netgen install
RUN cd /tools && git clone https://github.com/RTimothyEdwards/netgen.git lvs && cd lvs && ./configure --prefix=/tools/netgen && make -j && make install

#INSTALL PDK
ENV PATH="$PATH:/tools/magic/bin"
ENV PATH="$PATH:/tools/netgen/bin"
ENV PATH="$PATH:/tools/ngspice/bin"
ENV PATH="$PATH:/tools/xschem/bin"
RUN cd /tools && git clone git://opencircuitdesign.com/open_pdks pdk && cd pdk && ./configure --prefix=/tools/open_pdks --enable-sky130-pdk --with-sky130-variants=A --enable-primitive-sky130 --disable-io-sky130 --disable-sc-hs-sky130 --disable-sc-ms-sky130 --disable-sc-ls-sky130 --disable-sc-lp-sky130 --enable-sc-hd-sky130 --disable-sc-hdll-sky130 --disable-sc-hvl-sky130 --disable-alpha-sky130 --enable-xschem-sky130 --disable-sram-sky130 --disable-osu-t12-sky130 --disable-osu-t15-sky130 --disable-osu-t18-sky130 && make -j && make install && make veryclean

RUN echo "Done"
