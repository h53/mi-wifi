```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/h53/mi-wifi/main/shell.sh)" <stok> [password]
```
cdn
```
bash -c "$(curl -fsSL https://mi-wifi.pages.dev/shell.sh)" <stok> [password]
```

example
```
➜  mi-wifi ./shell.sh xxxxxxxxxxxxxxxxxx my-password
enable ssh ok!
change password ok!
spawn ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa root@192.168.31.1
root@192.168.31.1's password: 


BusyBox v1.25.1 (2020-09-21 11:45:55 UTC) built-in shell (ash)

 -----------------------------------------------------
       Welcome to XiaoQiang!
 -----------------------------------------------------
  $$$$$$\  $$$$$$$\  $$$$$$$$\      $$\      $$\        $$$$$$\  $$\   $$\
 $$  __$$\ $$  __$$\ $$  _____|     $$ |     $$ |      $$  __$$\ $$ | $$  |
 $$ /  $$ |$$ |  $$ |$$ |           $$ |     $$ |      $$ /  $$ |$$ |$$  /
 $$$$$$$$ |$$$$$$$  |$$$$$\         $$ |     $$ |      $$ |  $$ |$$$$$  /
 $$  __$$ |$$  __$$< $$  __|        $$ |     $$ |      $$ |  $$ |$$  $$<
 $$ |  $$ |$$ |  $$ |$$ |           $$ |     $$ |      $$ |  $$ |$$ |\$$\
 $$ |  $$ |$$ |  $$ |$$$$$$$$\       $$$$$$$$$  |       $$$$$$  |$$ | \$$\
 \__|  \__|\__|  \__|\________|      \_________/        \______/ \__|  \__|


root@XiaoQiang:~# exit
Connection to 192.168.31.1 closed.
```