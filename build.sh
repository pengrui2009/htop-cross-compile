#!/bin/sh
export NCURSES_INSTALL_PATH=$PWD/ncurses-5.9/install
export HTOP_INSTALL_PATH=$PWD/htop-2.0.1/install
export PATH=$PATH:/home/projects/embedded-grpc/5G_android_standalone_toolchain/bin/

cd ncurses-5.9
# build ncurses
./configure --prefix=$PWD/install  --host=arm-linux-gnueabihf --without-cxx --without-cxx-binding --without-ada --without-manpages --enable-overwrite --without-debug --without-tests --with-shared --without-tests --without-progs
make && make install
cd ../

cd htop-2.0.1
# build htop
./configure --prefix=$PWD/install --disable-unicode --host=arm-linux-gnueabihf  LDFLAGS=-L${NCURSES_INSTALL_PATH}/lib CPPFLAGS=-I${NCURSES_INSTALL_PATH}/include
make && make install
cd ..

[ -d build ] || mkdir build
cd build
cp -a ${NCURSES_INSTALL_PATH}/* .
cp -a ${HTOP_INSTALL_PATH}/* .
cd ../

