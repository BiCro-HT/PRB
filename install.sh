# Full Installation of Q.probe_design and its dependencies

# 1) load python 3.11.5, requires >=python3.10
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0
echo -e "python3 --version\n$(python3 --version)" # just to show python version
## tried this part: SUCCESS


# 2) probe_design is pip installable 
pip install probe_design
## this will also install pip installable dependencies including ifpd2q
## tried this part: SUCCESS

#  Installing non-pip dependencies
## 3.1) Install nHUSH
echo "3.1) installing nHUSH..."
cd ~/PRB/nHUSH
make
./makedeb
### since you do not have sudo access sudo apt install is not usable, use the following
echo 'export PATH=$PATH:~/PRB/nHUSH/bin/' >> ~/.bashrc
### /PRB added as the PATH
source ~/.bashrc


# 3.2) Install hush
echo "3.2) installing hush..."
cd ~/PRB/hush
make all -B
export MANPATH="$(man --path):`pwd`/man"
export PATH="$PATH:`pwd`/bin/"

# 3.3) Install escafish
echo "3.3) installing escafish..."
cd ~/PRB/escafish
make install

# 3.4) Install OligoArrayAux
### since no sudo access we can install the
echo "3.4) installing oligoarrayaux..."
cd ~/PRB/oligoarrayaux
rpm2cpio oligoarrayaux-3.8-1.x86_64.rpm | cpio -idv

# 5) Clone and pip Install GG's oligo-melting
echo "5) installing oligo-melting..."
cd ~/PRB
git clone http://github.com/ggirelli/oligo-melting
cd oligo-melting
pip3 install .
cd ~/PRB
### tried this part: SUCCESS
