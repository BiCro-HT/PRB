#!/bin/bash

# Full Installation of Q.probe_design and its dependencies

# 5) load python 3.11.5, requires >=python3.10
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0
echo -e "python3 --version\n$(python3 --version)" # just to show python version
## tried this part: SUCCESS
echo -e "\n\n"

## move things inside PRB/PRB/ to PRB/
mv ~/PRB/PRB/* ~/PRB/
export PATH=~/.local/bin:$PATH # add it to the PATH

# 0.1) download and install readline
echo "0.1) download and install readline"
cd ~/PRB
wget https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz
tar -xvf readline-8.2.tar.gz
cd readline-8.2
./configure --prefix=$HOME/PRB/readline
make
make install
export LD_LIBRARY_PATH=$HOME/PRB/readline/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/PRB/readline/lib/pkgconfig:$PKG_CONFIG_PATH
export C_INCLUDE_PATH=$HOME/PRB/readline/include:$C_INCLUDE_PATH
echo -e "\n\n"
# WORKS but 3.1 errors out

# 0.2) download and isntall liblua5.4.6
echo "0.2) download and compile liblua5.4.6"
cd ~/PRB
curl -L -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf lua-5.4.6.tar.gz
cd lua-5.4.6
make linux # or make macos, depending on your system
make INSTALL_TOP=$HOME/PRB install # install in $HOME/PRB
export PKG_CONFIG_PATH=$HOME/PRB/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/PRB/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/PRB/include:$C_INCLUDE_PATH
echo -e "\n\n"
# WORKS but 3.1 errors out 

# 0.5) install meson and ninja
pip install meson
cd ~/PRB
wget https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip 
unzip ninja-linux.zip
export PATH=$PWD:$PATH

meson setup builddir --buildtype release
cd builddir
meson compile
meson install
echo -e "\n\n"

#  Installing non-pip dependencies
## 1) Install nHUSH
echo "1) installing nHUSH..."
cd ~/PRB/nHUSH
make
./makedeb
### since you do not have sudo access sudo apt install is not usable, use the following
echo 'export PATH=$PATH:~/PRB/nHUSH/bin/' >> ~/.bashrc
### /PRB added as the PATH
source ~/.bashrc
echo -e "\n\n"

# 2) Install hush
echo "2) installing hush..."
cd ~/PRB/hush
make all -B
export MANPATH="$(man --path):`pwd`/man"
export PATH="$PATH:`pwd`/bin/"
echo -e "\n\n"

# 3) Install escafish
echo "3) installing escafish..."
cd ~/PRB/escafish
make install
echo -e "\n\n"

# 4) Install OligoArrayAux
### since no sudo access we can install the
echo "4) installing oligoarrayaux..."
cd ~/PRB
rpm2cpio oligoarrayaux-3.8-1.x86_64.rpm | cpio -idv
echo -e "\n\n"





# 6) probe_design is pip installable 
pip install probe_design
## this will also install pip installable dependencies including ifpd2q
## tried this part: SUCCESS
echo -e "\n\n"


# 7) Clone and pip Install GG's oligo-melting
echo "7) installing oligo-melting..."
cd ~/PRB
git clone http://github.com/ggirelli/oligo-melting
cd oligo-melting
pip3 install .
cd ~/PRB
### tried this part: SUCCESS
