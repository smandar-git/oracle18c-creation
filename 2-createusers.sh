groupadd -g 1020 asmadmin
groupadd -g 1021 asmdba
groupadd -g 1022 asmoper
groupadd -g 1023 oinstall
groupadd -g 1024 dba
groupadd -g 1025 oper
useradd -u 1100 -g oinstall -G dba,asmadmin,asmdba,asmoper grid
useradd -u 1101 -g oinstall -G dba,asmdba,oper oracle
chown -R oracle:oinstall /home/oracle
chown -R grid:asmadmin /home/grid
passwd oracle
passwd grid
