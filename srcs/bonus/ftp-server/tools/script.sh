#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /home/$FTP_USR/ftp

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /files/vsftpd.conf /etc/vsftpd/vsftpd.conf

    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
    chown -R $FTP_USR:$FTP_USR /home/$FTP_USR/ftp

    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf