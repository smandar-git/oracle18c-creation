Oracle Image Creation with grid ( 12.2)

NOTE : This procedure has been created for Oracle/Grid 18c

Download OEL7.5 ISO and upload to image-service on the cluster.

VM Creation
 Create a VM with 8 cpu 32GB Memory ( no VG)
 Boot disk 125GB
 2nd disk 100GB  /u01 ( grid home)
 3rd disk 100 GB /u02. (Oracle home)
 
 NOTE : if building for Era profile ,direct attach is ok
       else attach furthe disks via Volume Group

 4th disk  100 GB DB  (DATA1)- single disk (DATA) ok for Era profile
 5th disk  100GB  DB. (DATA2) (not required if creating Era profile)
 6th disk  100GB DB.  (DATA3) (not required if creating Era profile)
 7th disk. 100GB DB.  (DATA4 (not required if creating Era profile))
 8th disk. 100GB RECO1 (FRA/RECO) single disk attach ok for Era Profile
 9h disk. 100GB RECO2  (FRA/RECO (not required if creating Era profile))
 10th disk. 100GB ARCH (ArchiveLog) single disk attach ok if era profile 
 11th disk. 100GB ARCH (ArchiveLog) (not required if creating Era profile) 
 NOTE : Disk sizes and layouts will vary .if Creating Era profile , use 100 GB disks.

Partitioning : on boot disk

 /     100GiB
 /boot 1 GB
 Swap  24GB

Install options 
 -server with a GUI
 -options : development tools , compatibility libraries ,performance tools ,large systems performance , Java Platform  
 -Set root password  - suggested  use Welcome1
 -Accept license
 -set the hostname in /etc/hosts and /etc/hostname 
 -reboot


#Image customization

Once the VM is up and running
1) ensure DHCP provides an IP to the VM , if not troubleshoot or setup a static IP
2) enter the IP address and hostname  in /etc/hosts 
3) populate /etc/hostname  and ensure that the hostname is resolving.
 Otherwise Oracle install will fail during Listner config.3) populate /etc/hostname  and ensure that the hostname is resolving.
 Otherwise Oracle install will fail during Listner config.3) populate /etc/hostname  and ensure that the hostname is resolving.
 Otherwise Oracle install will fail during Listner config.

copy the script bundle into /root/scripts

Run the below scripts in sequence from /root/scripts as root user.
some scripts need to be run as grid/oracle user.
1-pre.sh ( customization for Oracle Best Practices)

2-createusers.sh ( Creates Oracle, GRID users and groups)

# need to create a password for oracle and grid  users not scripted

3-mku01u02.sh  ( creates oracle and grid home directories and gives right permissions )

4-prepASMdisks.sh( initializes asmLIB and adds disks to ASMlib)

installer can customize if required.
If using ASMFD , do not use this. 

5a-copy-oracle-home.sh ( copies files to oracle home dir - response files and bash profile)

5b-cp-grid-orcl-bin.sh ( extracts db and grid binaries to required folders to start install)

6a-install-grid.sh  ( grid installation via response file  - creates CRSDG and completesa )
 needs to be run as grid user

# if needing to change passwords , edit response file - default password used is welcome1 (lower case)
6b-create-asmdgs.sh ( creates additional diskgroups required for Oracle DB creation)
 (needs to be run as grid user)

7a-install-db-with-grid.sh ( installs database files silently -via response file)
(need to run as oracle user)

# if needing to change passwords , edit response file - default password used is welcome1 (lower case)

7b-create-db-with-grid.sh  ( creates a database )
(need to run as oracle user)

After running the above the database with SID=orcl will be created

bring up the database after logging in as oracle user >sqlplus / as sysdba   
sqlplus > startup


