#!/bin/sh
set -ex

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
    mkdir -p /var/www/html

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /files/vsftpd.conf /etc/vsftpd/vsftpd.conf

    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null


    sed -i "s|\(^$FTP_USR:[^:]*:[^:]*:[^:]*:[^:]*:\)[^:]*|\1/var/www/html|" /etc/passwd

    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
fi

chown -R $FTP_USR:$FTP_USR /var/www/html

chmod -R 755 /var/www/html

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf


