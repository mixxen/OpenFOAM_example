#!/bin/bash

#load env variables
source $HOME/OpenFOAM/OpenFOAM-3.0.1/etc/bashrc $FOAM_SETTINGS

cd $WM_PROJECT_DIR
export QT_SELECT=qt4

./Allwmake -j 4