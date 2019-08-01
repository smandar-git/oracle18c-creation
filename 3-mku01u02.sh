mkfs -F -t ext4 /dev/sdb
mkfs -F -t ext4 /dev/sdc
SDBUUID=`blkid | grep sdb | awk '{print $2}'`
SDCUUID=`blkid | grep sdc | awk '{print $2}'`
echo $SDBUUID $SDCUUID
mkdir /u01
mkdir /u02
echo $SDBUUID /u01 ext4 defaults,errors=remount-ro 0 1 >>/etc/fstab
echo $SDCUUID /u02 ext4 defaults,errors=remount-ro 0 1 >> /etc/fstab
clear
cat /etc/fstab
mount -a
df -h
chown -R grid:asmadmin /u01
chown -R oracle:oinstall /u02
chmod -R 755  /u01 
chmod -R 755  /u02 
mkdir /sw
