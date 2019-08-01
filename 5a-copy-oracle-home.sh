# copy bash profiles for oracle and grid

cp ./oracle_bash_profile /home/oracle/.bash_profile
cp ./grid_bash_profile /home/grid/.bash_profile
# change ownerships for .bash_profile for oracle and grid
chown oracle:oinstall /home/oracle/.bash_profile
chown grid:asmadmin /home/grid/.bash_profile

# copy script for creating ASM diskgroups after grid install
cp 6a-install-grid.sh /home/grid
cp 6b-create-asmdgs.sh /home/grid
cp createdg.sql /home/grid
chown grid:asmadmin /home/grid/*.sh
chown grid:asmadmin /home/grid/createdg.sql

# copy response files for grid , oracle and dbca
# grid install response file below
cp  install-grid18c.rsp  /home/grid
# oracle install response file below
cp  install-db-with-grid.rsp /home/oracle
# database create response file and sript
cp  dbca-dbcreate-with-grid.rsp  /home/oracle
cp  dbcreate.tar /home/oracle

# change ownerships  correctly
chown grid:asmadmin /home/grid/*.rsp
chown oracle:oinstall /home/oracle/*.rsp
chown oracle:oinstall /home/oracle/dbcreate.tar

cp 7a-install-db-with-grid.sh /home/oracle
cp 7b-create-db-with-grid.sh /home/oracle
cp 7c-putdbarchlog.sh /home/oracle
cp putdbarchlog.sql /home/oracle
chown oracle:oinstall /home/oracle/*.sh
chown oracle:oinstall /home/oracle/*.sql

