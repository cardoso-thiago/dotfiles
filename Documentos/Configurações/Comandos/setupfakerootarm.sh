#!/bin/bash
set -ex
cd /tmp

#pacman -S --needed --noconfirm base-devel

#git clone https://aur.archlinux.org/nosudo
#cd nosudo
#makepkg -o
#cp nosudo /bin/sudo
#chmod +x /bin/sudo
#cd ..

if false; then
rm -rf fakeroot-tcp
git clone https://aur.archlinux.org/fakeroot-tcp /tmp/fakeroot-tcp
fi
cd fakeroot-tcp
sed -e 's:\(patch -p.*\):\1||true:' PKGBUILD > PKGBUILD.2
sed -e 's:\(patch -p.*\):\1||true:' \
  -e 's:prefix=/usr:prefix=/tmp/fakeroot:' \
  -e 's:/usr/lib/libfakeroot:/tmp/fakeroot/libs:' \
  PKGBUILD > PKGBUILD.1
cat >> PKGBUILD.1 <<END
set -ex
cd src
build
sudo make install
END

makepkg -Asop PKGBUILD.2
bash PKGBUILD.1
PATH=/tmp/fakeroot/bin:$PATH makepkg -Aip PKGBUILD.2
ls -l *xz
echo Done
# vim:et sw=2 ts=2 ai nocp sta