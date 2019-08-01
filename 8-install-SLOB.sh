cd /home/oracle
git clone https://github.com/therealkevinc/SLOB_distribution.git
tar -xvf SLOB_distribution/2018.04.16.slob_2.4.2.1.tar.gz 
chown -R oracle:oinstall SLOB
cd SLOB/wait_kit/
make
cd /home/oracle
chown -R oracle:oinstall SLOB/wait_kit

