1. Разрежённый файл — файл, в котором последовательности нулевых байтов заменены на информацию об этих последовательностях (список дыр).
2. Жесткая ссылка и файл, для которой она создавалась имеют одинаковые inode. Поэтому жесткая ссылка имеет те же права доступа, владельца и время последней модификации, что и целевой файл. Различаются только имена файлов. Фактически жесткая ссылка это еще одно имя для файла.
3. andy@Computer:~/Desktop/Vagrant$ vagrant destroy <br/>
    default: Are you sure you want to destroy the 'default' VM? [y/N] y<br/>
==> default: Destroying VM and associated drives...<br/>

4. Device       Start     End Sectors  Size Type<br/>
/dev/sdb1     2048 4196351 4194304    2G Linux filesystem<br/>
/dev/sdb2  4196352 5242846 1046495  511M Linux filesystem<br/>
5. <br/>![img_6.png](img_6.png)
6.<br/> ![img_8.png](img_8.png)


7. <br/>![img_9.png](img_9.png)
8. vagrant@vagrant:~$ sudo pvcreate /dev/md1 /dev/md0<br/>
  Physical volume "/dev/md1" successfully created.<br/>
  Physical volume "/dev/md0" successfully created.<br/>

9. vagrant@vagrant:~$ sudo vgcreate vg1 /dev/md1 /dev/md0<br/>
  Volume group "vg1" successfully created<br/>
10. vagrant@vagrant:~$ sudo lvcreate -L 100M vg1 /dev/md1<br/>
  Logical volume "lvol0" created.<br/>
11. vagrant@vagrant:~$ sudo mkfs.ext4 /dev/vg1/lvol0<br/>
mke2fs 1.45.5 (07-Jan-2020)<br/>
Creating filesystem with 25600 4k blocks and 25600 inodes<br/>
Allocating group tables: done                            <br/>
Writing inode tables: done                            <br/>
Creating journal (1024 blocks): done<br/>
Writing superblocks and filesystem accounting information: done<br/>
12. vagrant@vagrant:~$ mkdir /tmp/new<br/>
vagrant@vagrant:~$ sudo mount /dev/vg1/lvol0 /tmp/new<br/>
13. root@vagrant:~# wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz<br/>
--2022-02-06 11:46:55--  https://mirror.yandex.ru/ubuntu/ls-lR.gz<br/>
Resolving mirror.yandex.ru (mirror.yandex.ru)... 213.180.204.183, 2a02:6b8::183<br/>
Connecting to mirror.yandex.ru (mirror.yandex.ru)|213.180.204.183|:443... connected.<br/>
HTTP request sent, awaiting response... 200 OK<br/>
Length: 22107112 (21M) [application/octet-stream]<br/>
Saving to: ‘/tmp/new/test.gz’<br/>
<br/>
/tmp/new/test.gz                                     100%[=====================================================================================================================>]  21.08M  10.2MB/s    in 2.1s<br/>    
<br/>
2022-02-06 11:46:57 (10.2 MB/s) - ‘/tmp/new/test.gz’ saved [22107112/22107112]<br/>
root@vagrant:~#<br/>

14.<br/> ![img_10.png](img_10.png)
15. root@vagrant:~# gzip -t /tmp/new/test.gz<br/> 
root@vagrant:~# echo $?<br/> 
0<br/> 
16. root@vagrant:~# pvmove /dev/md1 /dev/md0<br/> 
  /dev/md1: Moved: 12.00%<br/> 
  /dev/md1: Moved: 100.00%<br/> 
17. root@vagrant:~# mdadm /dev/md0 --fail /dev/sdb1<br/> 
mdadm: set /dev/sdb1 faulty in /dev/md0<br/> 
18. [ 5183.011599] md/raid1:md0: Disk failure on sdb1, disabling device.<br/> 
               md/raid1:md0: Operation continuing on 1 devices.<br/> 
19. root@vagrant:~# gzip -t /tmp/new/test.gz<br/> 
root@vagrant:~# echo $?<br/> 
0<br/> 
20. andy@Computer:~/Desktop/Vagrant$ vagrant destroy<br/> 
    default: Are you sure you want to destroy the 'default' VM? [y/N] y<br/> 
==> default: Forcing shutdown of VM...<br/> 
==> default: Destroying VM and associated drives...<br/> 

















