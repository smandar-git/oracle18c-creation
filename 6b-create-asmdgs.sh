echo "what is the ASM diskgroup version" you want to use
echo "edit createdg.sql appropriately before running this script"
echo "example sed -i 's/12.1/18.1/g' createdg.sql"
echo "hit ctrl c to abort or return to continue"
read i 
sqlplus / as sysasm <<EOF
@createdg.sql;
EOF
asmcmd lsdg
