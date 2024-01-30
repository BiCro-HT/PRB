#!/bin/bash
# Full Installation of Q.probe_design and its dependencies

# Pre-requisites:
echo '# >>> probe_design and dependencies starts here>>>' >> $HOME/.bashrc
if ! grep -q "export PATH=\$HOME/.local/bin:\$PATH" $HOME/.bashrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.bashrc
  source $HOME/.bashrc
fi
PRBDIR=$HOME/PRB

# tried this part: SUCCESS

# move things inside PRB/PRB/ to PRB/
echo "1) moving things inside PRB/PRB/ to PRB/"
mv $PRBDIR/PRB/* $PRBDIR/
echo -e "\n\n"
# tried this part: SUCCESS

# 2) Install hush
echo "2) installing hush..."
cd $PRBDIR/hush
make all -B
echo 'export MANPATH="$HOME/PRB/hush/man:$MANPATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/PRB/hush/bin:$PATH"' >> $HOME/.bashrc
echo -e "\n\n"
# tried this part: SUCCESS

# 3) Install escafish
echo "3) installing escafish..."
cd $PRBDIR/escafish
make install
echo 'export MANPATH="$HOME/.local/man/:$MANPATH"' >> $HOME/.bashrc
# no need to add bin to PATH as it is already in $HOME/.local/bin
echo -e "\n\n"
# tried this part: SUCCESS

# 4) Install OligoArrayAux
echo "4) installing oligoarrayaux..."
cd $PRBDIR/oligoarrayaux
rpm2cpio oligoarrayaux-3.8-1.x86_64.rpm | cpio -idv
echo 'export PATH="$HOME/PRB/oligoarrayaux/usr/bin:$PATH"' >> $HOME/.bashrc
echo 'export MANPATH="$HOME/PRB/oligoarrayaux/usr/share/man:$MANPATH"' >> $HOME/.bashrc
echo -e "\n\n"
# tried this part: SUCCESS

# 5) load python 3.11.5, requires >=python3.10
#echo 'export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH' >> $HOME/.bashrc #for python
conda conda create -n probe python=3.11.5
conda activate probe
conda install pip
echo 'export MODULEPATH=/share/apps/spack/latest-2024-01-17/modules-files/linux-centos8-skylake_avx512:$MODULEPATH' >> $HOME/.bashrc # for nhush
source $HOME/.bashrc

# 5.2) load nhush
module load nhush
echo -e "python3 --version\n$(python3 --version)" # just to show python version
echo -e "\n\n"
## tried this part: SUCCESS

# 6) probe_design is pip installable 
pip install probe_design -U # this will also install pip installable dependencies including ifpd2q
echo -e "\n\n"
## tried this part: SUCCESS

# 7) Clone and pip Install GG's oligo-melting
echo "7) installing oligo-melting..."
cd $PRBDIR
git clone http://github.com/ggirelli/oligo-melting
cd oligo-melting
pip install .
echo -e "\n\n"
cd $PRBDIR
### tried this part: SUCCESS

# PRINT RESULTS
pip show probe_design >> $PRBDIR/completion.log
pip show ifpd2q >> $PRBDIR/completion.log 
pip show oligo_melting >> $PRBDIR/completion.log
which hushp >> $PRBDIR/completion.log
which escafish >> $PRBDIR/completion.log
which hybrid-min >> $PRBDIR/completion.log # oligoarrayaux
which nhush >> $PRBDIR/completion.log
cat $PRBDIR/completion.log


# THIS PART IS NO longer necessary as nHUSH will be installed directly as a module for HPC
: '
# 0.1) download and install readline
echo "0.1) download and install readline"
cd $PRBDIR
wget https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz
tar -xvf readline-8.2.tar.gz
cd readline-8.2
./configure --prefix=$PRBDIR/readline
make
make install
export LD_LIBRARY_PATH=$HOME/PRB/readline/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/PRB/readline/lib/pkgconfig:$PKG_CONFIG_PATH
export C_INCLUDE_PATH=$HOME/PRB/readline/include:$C_INCLUDE_PATH
echo -e "\n\n"
# WORKS but 3.1 errors out

# 0.2) download and isntall liblua5.4.6
echo "0.2) download and compile liblua5.4.6"
cd $PRBDIR
curl -L -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz
tar zxf lua-5.4.6.tar.gz
cd lua-5.4.6
make linux # or make macos, depending on your system
make INSTALL_TOP=$PRBDIR install # install in $PRBDIR
export PKG_CONFIG_PATH=$HOME/PRB/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/PRB/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/PRB/include:$C_INCLUDE_PATH
echo -e "\n\n"
# WORKS but 3.1 errors out 

# 0.5) install meson and ninja
pip install meson
cd $PRBDIR
wget https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip 
unzip ninja-linux.zip
export PATH=$PWD:$PATH


#  Installing non-pip dependencies
## 1) Install nHUSH
echo "1) installing nHUSH..."
cd $PRBDIR/nHUSH
meson setup builddir --buildtype release
cd builddir
meson compile
meson install
echo -e "\n\n"

#make
#./makedeb
### since you do not have sudo access sudo apt install is not usable, use the following
echo "export PATH=$PATH:$HOME/PRB/nHUSH/bin/" >> $HOME/.bashrc
### /PRB added as the PATH
source $HOME/.bashrc
echo -e "\n\n"
'
echo '#<<<probe_design ends here <<<' >> $HOME/.bashrc
