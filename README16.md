1. <br/>![img_82.png](img_82.png)<br/>
2. <br/>![img_83.png](img_83.png)<br/>
![img_84.png](img_84.png)
SELECT * FROM information_schema.table_privileges;<br/>
![img_85.png](img_85.png)
![img_86.png](img_86.png)
SELECT * FROM information_schema.table_privileges where grantee = 'test-simple-user';<br/>
![img_98.png](img_98.png)
3. insert into orders VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);<br/>
insert into clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'), (4, 'Ронни Джеймс Дио', 'Russia'), (5, 'Ritchie Blackmore', 'Russia');<br/>
![img_91.png](img_91.png)<br/>
![img_92.png](img_92.png)<br/>
4. update clients set заказ = 3 where id = 1;<br/>
update clients set заказ = 4 where id = 2;<br/>
update clients set заказ = 5 where id = 3;<br/>
![img_93.png](img_93.png)<br/>
5. <br/>![img_94.png](img_94.png)<br/>
команда explain select * from clients where заказ is not null; показывает подробный план запроса - последовательное сканирование в таблице clients, с фильтром - "заказ" IS NOT NULL, показывает стоимость запроса (нагрузку на исполнение)<br/>
6. root@da14e70516fa:/# pg_dump -U test-admin-user -d test_db > /home/pgbackup/test_db_dump.sql<br/>
docker-compose down<br/>
создал новый docker-compose1.yml:<br/>
![img_95.png](img_95.png)<br/>
docker-compose -f docker-compose1.yml up -d<br/>
docker exec -it d1d03e8ce38b bash<br/>
root@d1d03e8ce38b:/# psql -U test-admin-user<br/>
test-admin-user=# CREATE DATABASE test_db;<br/>
root@d1d03e8ce38b:/# psql -U test-admin-user -d test_db < /home/pgbackup/test_db_dump.sql<br/>
![img_96.png](img_96.png)<br/>
![img_97.png](img_97.png)<br/>