# PRB

IMPORTANT: change **your_password** with the password provided by Zafer Kosar.
If you don't have access, zafer.kosar@external.fht.org


## Open a bash terminal and followed the instructions below

### tldr version

```shell
git clone https://github.com/BiCro-HT/PRB.git ~/
cd ~/PRB
openssl enc -d -aes-256-cbc -pass pass:your_password -in PRB.tar.gz.enc | tar xzf -
mv ~/PRB/PRB/* ~/PRB
bash ~/PRB/install.sh

```

### Step-by-step

1. Clone this repository to your home directory at HPC

```shell
git clone https://github.com/BiCro-HT/PRB.git ~/
```

2. Change directory to PRB folder

```shell
cd ~/PRB
```

3. Unzip Encrypted tar.gz file into this directory

```shell
openssl enc -d -aes-256-cbc -pass pass:your_password -in PRB.tar.gz.enc | tar xzf -
```

4. Move the folders from ~/PRB/PRB to ~/PRB

```shell
mv ~/PRB/PRB/* ~/PRB

```

5. Run the install.sh

```shell
bash ~/PRB/install.sh
```

## USAGE TIP

Note: For now this project depends on the python to use it you have to load the modules

```shell
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0

python3 --version

```