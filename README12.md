1. https://hub.docker.com/repository/docker/andreymedvedtsev/ngnix<br/>
![img_74.png](img_74.png)
2. 
* Высоконагруженное монолитное java веб-приложение;<br/>
контейнеры Docker используются в основном в микросервисной архитектуре приложений, поэтому для монолитного приложения лучше использовать виртуальную или физическую машину. 
* Nodejs веб-приложение;<br/>
Использование Docker позволит оптимизировать процесс разработки и вывода в продакшн Node.js приложения поскольку есть возможность упаковать все зависимости и настройки в единый образ<br/>
* Мобильное приложение c версиями для Android и iOS;<br/>
Для разработки мобильного приложения предпочтительно использование отдельных контейнеров для разных ОС, в которых зависимости и настройки находятся в едином образе<br/>
* Шина данных на базе Apache Kafka;<br/>
Шина данных может использоваться для связи микросервисов, поэтому использование Docker контейнеров в данном случае подходит<br/>
* Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;<br/>
Logstash отвечает за логирование и поставляет входящий поток данных в Elasticsearch для хранения, классификации и поиска. Kibana, в свою очередь, получает доступ к данным Elasticsearch для их визуализации. Всё это можно реализовать в контейнерах Docker<br/>
* Мониторинг-стек на базе Prometheus и Grafana;<br/>
Поскольку Prometheus получает метрики из разных сервисов и собирает их в одном месте, а Grafana получает данные из Prometheus посредством http запросов, указанный мониторинг-стек может быть реализован как на виртуальная или физической машине, так и в контейнере Docker<br/> 
* MongoDB, как основное хранилище данных для java-приложения;<br/>
Java-приложение подключается к БД используя сетевой порт, поэтому возможно использование как виртуальной или физической машины, так и контейнера Docker<br/>
* Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.<br/>
Создание приватного Docker Registry выполняется посредством установки и соответствующей настройки контейнера Docker. Установка Gitlab CI/CD также возможна из контейнера Docker<br/>         
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