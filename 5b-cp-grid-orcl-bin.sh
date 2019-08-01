#this script expects oracle and grid binaries in /sw


# copy grid home and install cvudisk.rpm
mkdir -p /u01/app/18.0.0/grid
cd /u01/app/18.0.0/grid
unzip  -q /sw/LINUX.X64_180000_grid_home.zip
chown -R grid:asmadmin /u01
chmod -R 755 /u01
rpm -ihv /u01/app/18.0.0/grid/cv/rpm/cvuqdisk-1.0.10-1.rpm

# copy oracle homes
mkdir -p /u02/app/oracle/product/18.0.0/dbhome_1
cd /u02/app/oracle/product/18.0.0/dbhome_1
unzip -q /sw/LINUX.X64_180000_db_home.zip
chown -R oracle:oinstall /u02
chmod -R 755 /u02
