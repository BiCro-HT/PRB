# PRB

IMPORTANT: change **your_password** with the password provided by Zafer Kosar.
If you don't have access, zafer.kosar@external.fht.org


## TLDR version

1. Copy and paste this to text editor
2. modify **your_password** with the real password
3. Copy all from the text editor and paste it into terminal

```shell
git clone https://github.com/BiCro-HT/PRB.git ~/PRB
cd ~/PRB
openssl enc -d -aes-256-cbc -pass pass:your_password -in PRB.tar.gz.enc | tar xzf -
source ~/PRB/install.sh

```

## Step-by-step

### Open a bash terminal and follow the instructions below

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


4. Run the install.sh

```shell
source ~/PRB/install.sh
```

## USAGE TIP

Note: For now this project depends on the python to use it you have to load the modules

```shell
module load python/3.11.5
module load python-3.11.5/py-pip/23.0
python3 --version
```
