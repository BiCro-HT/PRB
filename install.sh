# Full Installation of Q.probe_design and its dependencies

# 1) load python 3.11.5, requires >=python3.10
echo "1) loading python 3.11.5..."
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0
echo -e "python3 --version\n$(python3 --version)" # just to show python version
## tried this part: SUCCESS


# 2) probe_design is pip installable 
echo "2) installing probe_design..."
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
### /PRB added for the correct PATH
source ~/.bashrc

# 3.2) Install hush
echo "3.2) installing hush..."
cd ~/PRB/hush
make all -B
export MANPATH="$(man --path):`pwd`/man"
export PATH="$PATH:`pwd`/bin/"
## NO errors, SUCCESS?

# 3.3) Install escafish
echo "3.3) installing escafish..."
mkdir ~/.local/man # if they do not exist, in my case they did not
mkdir ~/.local/man/man1
cd ~/PRB/escafish
make install
## cp: cannot create regular file '/usr/local/bin/escafish': Permission denied ^
### SOlVED

# 4) Install OligoArrayAux
### since no sudo access we can install the
echo "4) installing oligoarrayaux..."
cd ~/PRB
rpm2cpio oligoarrayaux-3.8-1.x86_64.rpm | cpio -idv
## SUCCESS

# 5) Clone and pip Install GG's oligo-melting
echo "5) installing oligo-melting..."
cd ~/PRB
git clone http://github.com/ggirelli/oligo-melting
cd oligo-melting
pip3 install .
cd ~/PRB
## SUCCESS
