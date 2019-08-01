PWD=`pwd`
if [ $PWD != "/root/scripts" ];then
 echo "please ensure scripts are copied to /root/scripts"
 echo "also run as root user only "
   exit
else
echo "starting pre-install script"
echo systemctl stop libvirtd
systemctl disable libvirtd
echo systemctl stop firewalld
echo systemctl disable firewalld
echo systemctl stop avahi-daemon.socket
echo systemctl disable avahi-daemon.socket
echo systemctl stop NetworkManager
echo systemctl disable NetworkManager
cp ./public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo
yum repolist
yum install oracle-database-server-preinstall-18c -y
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl start chronyd
systemctl enable chronyd
/usr/bin/chronyc makestep
systemctl disable ntpd
systemctl stop ntpd
/usr/bin/cp ./sysctl.conf /etc/sysctl.conf
#removing users created by oracle-preinstall rpm
sed -i    '/oracle/d' /etc/passwd
sed   -i  '/oracle/d' /etc/group
#install additional dependencies
yum install compat-db* ksh libaio-devel sysstat unixODBC sysfsutils sg3_utils lsscsi zlib-devel libXp-devel libXScrnSaver  compat-libstdc++-33* oracleasm-support -y
cat /root/scripts/securityadd >> /etc/security/limits.conf
cat ./addtoprofile >> /etc/profile
ntpdate 1.ro.pool.ntp.org
echo "reboot the server"
fi
