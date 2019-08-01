# run as oracle user
. ./.bash_profile
cd $ORACLE_HOME
./runInstaller -silent  -ignorePrereqFailure  -waitforcompletion  -responseFile /home/oracle/install-db-with-grid2.rsp
cd
