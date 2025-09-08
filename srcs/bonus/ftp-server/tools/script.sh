#!/bin/sh
# set -ex

if ! id "$FTP_USR" >/dev/null 2>&1; then

    mkdir -p /var/run/vsftpd/empty
    chmod 755 /var/run/vsftpd/empty 
    mkdir -p /var/www/html
    adduser -D -h /home/$FTP_USR $FTP_USR
    echo "$FTP_USR:$FTP_PWD" | chpasswd
    chown -R $FTP_USR:$FTP_USR /var/www/html
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
    mv /files/vsftpd.conf /etc/vsftpd/vsftpd.conf
fi

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf -obackground=NO
