# PRB

IMPORTANT: change **your_password** with the password provided by Zafer Kosar.
If you don't have access, zafer.kosar@external.fht.org


## tldr version

1. Copy and paste this to text editor
2. modify **your_password** with the real password
3. Copy all from the text editor and paste it into terminal

```shell
git clone https://github.com/BiCro-HT/PRB.git ~/PRB
cd ~/PRB
openssl enc -d -aes-256-cbc -pass pass:your_password -in /PRB.tar.gz.enc | tar xzf -
mv ~/PRB/PRB/* ~/PRB/
export PATH=~/.local/bin:$PATH
bash ~/PRB/install.sh


```

## Open a bash terminal and follow the instructions below

### Step-by-step

1. Clone this repository to your home directory at HPC

```shell
git clone https://github.com/BiCro-HT/PRB.git ~/PRB
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

## A Quick fix to PATH warning

If you're getting `/home/name.lastname/.local/bin not on the PATH` warning

```shell
export PATH=~/.local/bin:$PATH

```