1. andy@Computer:$ ip -c -br link<br/>
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP> <br/>
enp3s0           UP             9c:5c:8e:85:01:8d <BROADCAST,MULTICAST,UP,LOWER_UP><br/> 
wlp6s0           DOWN           e0:69:95:44:86:d6 <NO-CARRIER,BROADCAST,MULTICAST,UP> <br/>
andy@Computer:$ <br/>
Команды для просмотра сетевых интерфейсов:
ip - в Linux<br/>
ipconfig  - в Windows<br/>
2. LLDP<br/>
пакет lldpd<br/>
команда lldpctl<br/>
3. VLAN (Virtual Local Area Network) — виртуальная локальная компьютерная сеть.<br/>
в linux устанавливается пакет vlan, iproute2.<br/>
ip link add link enp3s0 name enp3s0.10 type vlan id 1<br/>
ip link set dev enp3s0.10 up <br/>
ip addr add 10.0.0.1/24 dev enp3s0.10<br/>
![img_22.png](img_22.png)<br/>
4. LAG – агрегация портов.<br/>
Типы LAG:<br/>
статический;<br/>
динамический – LACP протокол.<br/>
![img_23.png](img_23.png)<br/>
![img_24.png](img_24.png)<br/>
опции для балансировки нагрузки:<br/>
active-backup<br/>
balance-xor<br/>
broadcast<br/>
802.3ad<br/>
balance-tlb<br/>
balance-alb<br/>
5. Сколько IP адресов в сети с маской /29 ? <br/> 
6<br/>
![img_25.png](img_25.png)<br/> 
Сколько /29 подсетей можно получить из сети с маской /24<br/>
32<br/>
Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24:<br/>
![img_27.png](img_27.png)<br/>

6. Из какой подсети допустимо взять частные IP адреса?<br/>
100.64.0.0/10<br/>
![img_28.png](img_28.png)<br/>
7. Как проверить ARP таблицу в Linux, Windows?<br/>
arp -a<br/>
Как очистить ARP кеш полностью?<br/>
ip link set arp off dev enp3s0<br/>
Как из ARP таблицы удалить только один нужный IP?<br/>
arp -d 192.168.1.1