FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y build-essential binutils-dev cmake flex bison zlib1g-dev qt4-dev-tools libqt4-dev libqtwebkit-dev gnuplot \
    libreadline-dev libncurses-dev libxt-dev libopenmpi-dev openmpi-bin libboost-system-dev libboost-thread-dev libgmp-dev \
    libmpfr-dev python python-dev

RUN apt-get install -y libglu1-mesa-dev libqt4-opengl-dev

RUN mkdir /root/OpenFOAM

ADD OpenFOAM-3.0.1.tgz /root/OpenFOAM
ADD ThirdParty-3.0.1.tgz /root/OpenFOAM

RUN ln -s /usr/bin/mpicc.openmpi /root/OpenFOAM/OpenFOAM-3.0.1/bin/mpicc
RUN ln -s /usr/bin/mpirun.openmpi /root/OpenFOAM/OpenFOAM-3.0.1/bin/mpirun

RUN echo "alias of301='source \$HOME/OpenFOAM/OpenFOAM-3.0.1/etc/bashrc $FOAM_SETTINGS'" >> $HOME/.bashrc

ADD build-thirdparty.sh /root/OpenFOAM
RUN chmod +x /root/OpenFOAM/build-thirdparty.sh && /root/OpenFOAM/build-thirdparty.sh

ADD build-paraview.sh /root/OpenFOAM
RUN chmod +x /root/OpenFOAM/build-paraview.sh && /root/OpenFOAM/build-paraview.sh

ADD build-openfoam.sh /root/OpenFOAM
RUN chmod +x /root/OpenFOAM/build-openfoam.sh && /root/OpenFOAM/build-openfoam.sh