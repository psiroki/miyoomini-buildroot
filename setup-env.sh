export CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
export PREFIX=/usr
export UNION_PLATFORM=miyoomini
export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/:/usr/local/lib/pkgconfig/
export CC="arm-linux-gnueabihf-gcc"
export CXX="arm-linux-gnueabihf-g++"
apt update >/dev/null 2>&1 &
