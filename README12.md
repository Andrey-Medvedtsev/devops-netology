1. https://hub.docker.com/repository/docker/andreymedvedtsev/ngnix<br/>
![img_74.png](img_74.png)
2.

3.
* Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера<br/>
docker run -d -v /home/vagrant/data:/home/data --name centos_test centos tail -f /dev/null<br/>
* Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера<br/>
docker run -d -v /home/vagrant/data:/home/data --name debian_test debian tail -f /dev/null<br/>
![img_76.png](img_76.png)<br/>
* Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data;<br/>
docker exec -it centos_test bash<br/>
echo "this test file from CenOS" > /home/data/test<br/>
![img_75.png](img_75.png)<br/>
* Добавьте еще один файл в папку /data на хостовой машине;<br/>
echo "This file from Host computer" > test1<br/>
![img_77.png](img_77.png)<br/>
* Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.<br/>
docker exec -it debian_test bash<br/>
![img_78.png](img_78.png)<br/>

4. https://hub.docker.com/repository/docker/andreymedvedtsev/ansible<br/>