#!/bin/bash

#load env variables
source $HOME/OpenFOAM/OpenFOAM-3.0.1/etc/bashrc $FOAM_SETTINGS

cd $WM_THIRD_PARTY_DIR
export QT_SELECT=qt4

./makeParaView4 -python -mpi -python-lib /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0