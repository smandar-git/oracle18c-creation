# run as oracle user
. ./.bash_profile
#dbca -silent -responseFile /home/oracle/dbca-dbcreate-with-grid.rsp
dbca -silent -createDatabase  -responsefile dbca-dbcreate-with-grid2.rsp
