sudo apt-get -y -f install
sudo apt-get -y remove python python-pip python-setuptools python-support python-ndg-httpsclient python-openssl
sudo apt-get -y remove python3 python3-pip python3-setuptools python3-support python3-ndg-httpsclient python3-openssl
sudo apt-get -y autoremove

sudo rm -rf /usr/bin/pip*
sudo rm -rf /usr/local/lib/python*
sudo rm -rf /usr/src/Python*

sudo apt-get -y install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

sudo apt-get -y install python3 python3-pip
sudo ln -s /usr/local/bin/pip3.8 /usr/bin/pip3

cd /usr/src
curl https://www.openssl.org/source/openssl-1.1.1c.tar.gz | tar xz
cd openssl-1.1.1c/
./config shared --prefix=/usr/local/
make -j 4
sudo make install

export LDFLAGS="-L/usr/local/lib/"
export LD_LIBRARY_PATH="/usr/local/lib/"
export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"

cd /usr/src
curl https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz | tar xz
cd Python-3.8.2/
./configure --enable-optimizations --with-openssl=/usr/src/openssl-1.1.1c --with-ensurepip=install
make -j 4
sudo su
export LDFLAGS="-L/usr/local/lib/"
export LD_LIBRARY_PATH="/usr/local/lib/"
export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl"
make install

cp /usr/local/bin/python3.8 /usr/bin/
rm /usr/bin/python3
ln -s /usr/bin/python3.8 /usr/bin/python3

sed -i -- 's/1.5.6/19.2.3/g' /usr/bin/pip3
