#!/usr/bin/expect
set passwd [ lindex $argv 0 ]

set timeout 10 
spawn ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa root@192.168.31.1
expect {
  "yes/no" { send "yes\n";exp_continue }
  "password" { send "$passwd\n" }
}
interact