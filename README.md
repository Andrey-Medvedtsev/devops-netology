1. После скачивания и распаковки переместил node_exporter в /usr/local/bin.
создал пользователя sudo useradd -rs /bin/false node_exporter <br/>
в файле node_exporter.service:<br/>
sudo nano /etc/systemd/system/node_exporter.service <br/>
прописал:<br/>
[Unit] <br/>
Description=Node Exporter<br/>
EnvironmentFile=/etc/default/node_exporter<br/>
After=network.target<br/>
<br/>
[Service]<br/>
User=node_exporter<br/>
Group=node_exporter<br/>
Type=simple<br/>
ExecStart=/usr/local/bin/node_exporter<br/>
<br/>
[Install]<br/>
WantedBy=multi-user.target<br/>
проверил работу: <br/>
sudo systemctl daemon-reload<br/>
sudo systemctl start node_exporter<br/>
sudo systemctl enable node_exporter<br/>
sudo systemctl status node_exporter<br/>
<br/>
● node_exporter.service - Node Exporter<br/>
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)<br/>
     Active: active (running) since Mon 2022-01-31 22:43:44 +05; 2h 51min left<br/>
   Main PID: 1426 (node_exporter)<br/>
      Tasks: 11 (limit: 38389)<br/>
     Memory: 17.5M<br/>
        CPU: 377ms<br/>

2.<br/>![img_3.png](img_3.png)

Для мониторинга памяти:<br/>
node_memory_MemAvailable_bytes Memory information field MemAvailable_bytes.<br/>
node_memory_MemFree_bytes Memory information field MemFree_bytes.<br/>
node_memory_MemTotal_bytes Memory information field MemTotal_bytes.<br/>
Для мониторинга диска:<br/>
node_disk_read_time_seconds_total The total number of seconds spent by all reads.<br/>
node_disk_write_time_seconds_total This is the total number of seconds spent by all writes.<br/>
Для мониторинга сети:<br/>
node_network_receive_packets_total Network device statistic receive_packets.<br/>
node_network_transmit_packets_total Network device statistic transmit_packets.<br/>
Для мониторинга процессора:<br/>
process_cpu_seconds_total Total user and system CPU time spent in seconds.<br/>

3.<br/>![img_4.png](img_4.png)
метрики:<br/>
cpu:<br/>
Total CPU utilization (all cores). 100% here means there is no CPU idle time at all.<br/>
load:<br/>
Current system load, i.e. the number of processes using CPU or waiting for system resources (usually CPU and disk)<br/>
disk:<br/>
Total Disk I/O, for all physical disks<br/>



4. По выводу dmsg можно понять, что ОС, что загружена не на настоящем оборудовании <br/>
vagrant@vagrant:~$ sudo dmesg | grep "Hypervisor detected"<br/>
[    0.000000] Hypervisor detected: KVM


5. vagrant@vagrant:~$ sysctl -n fs.nr_open <br/>
1048576<br/>
This denotes the maximum number of file-handles a process can
allocate. Default value is 1024*1024 (1048576) <br/>

vagrant@vagrant:~$ ulimit -a<br/>
open files         (-n) 1024<br/>
другой существующий лимит не позволит достичь такого числа: <br/>
-n	the maximum number of open file descriptors

6. root@Computer:~# unshare -f -p --mount-proc /bin/bash<br/>

root@Computer:~# sleep 1h<br/>
^Z<br/>
[1]+  Stopped                 sleep 1h<br/>
root@Computer:~# ps<br/>
    PID TTY          TIME CMD<br/>
      1 pts/1    00:00:00 bash<br/>
      9 pts/1    00:00:00 sleep<br/>
     10 pts/1    00:00:00 ps<br/>

но когда подключаюсь из хостового неймспейса PID-ы родителя:<br/>
root@Computer:~# ps aux<br/>
root        6369  0.0  0.0  16988   940 pts/1    S    19:22   0:00 unshare -f -p --mount-proc /bin/bash<br/>
root        6822  0.0  0.0  19872  5496 pts/0    S    19:27   0:00 -bash<br/>

root@Computer:~# nsenter --target 6369 --pid --mount<br/>
root@Computer:/# ps<br/>
Error, do this: mount -t proc proc /proc<br/>
root@Computer:/# mount -t proc proc /proc<br/>
root@Computer:/# <br/>
root@Computer:/# ps<br/>
    PID TTY          TIME CMD<br/>
   6816 pts/0    00:00:00 sudo<br/>
   6822 pts/0    00:00:00 bash<br/>
   6998 pts/0    00:00:00 nsenter<br/>
   6999 pts/0    00:00:00 bash<br/>
   7031 pts/0    00:00:00 ps<br/>

7. :(){ :|:& };: - это форк-бомба, когда создается процесс, который порождает новый процесс и т.д., пока не будут использованы все ресурсы.<br/>
[  963.683784] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-5.scope<br/>
автоматической стабилизации помог механизм Linux Control Cgroups, обеспечивающий изоляцию процессов в плане потребления ресурсов.<br/>
по умолчанию:<br/>
vagrant@vagrant:~$ ulimit -a<br/>
max user processes              (-u) 3571<br/>
Если установить ulimit -u 50 - число процессов будет ограничено 50 для пользователя.<br/> 












