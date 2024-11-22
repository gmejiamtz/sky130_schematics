FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV LANG C.UTF-8
ARG INSTALL_ZSH="true"

RUN apt-get update

RUN apt-get -y install git cmake ngspice magic netgen libx11-dev libxrender-dev libx11-dev libcairo-dev tcl-dev tk-dev bison flex libxpm-dev

#INSTALL xschem
RUN cd /opt &&  git clone https://github.com/StefanSchippers/xschem.git xschem-src && cd xschem-src && ./configure && make -j

#INSTALL PDK
RUN cd /opt && git clone git://opencircuitdesign.com/open_pdks pdk && cd pdk && ./configure --prefix=/opt/open_pdks --enable-sky130-pdk --with-sky130-variants=A --enable-primitive-sky130 --disable-io-sky130 --disable-sc-hs-sky130 --disable-sc-ms-sky130 --disable-sc-ls-sky130 --disable-sc-lp-sky130 --enable-sc-hd-sky130 --disable-sc-hdll-sky130 --disable-sc-hvl-sky130 --disable-alpha-sky130 --enable-xschem-sky130 --disable-sram-sky130 --disable-osu-t12-sky130 --disable-osu-t15-sky130 --disable-osu-t18-sky130 && make -j && make install && make veryclean

RUN echo "Done"
