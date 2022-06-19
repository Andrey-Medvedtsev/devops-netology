1. <br/>![img_124.png](img_124.png)<br/>
https://hub.docker.com/repository/docker/andreymedvedtsev/elasticsearch<br/>
![img_125.png](img_125.png)<br/>
![img_127.png](img_127.png)<br/>
![img_126.png](img_126.png)<br/>

2. добавьте в elasticsearch 3 индекса<br/>
![img_128.png](img_128.png)<br/>
Получите список индексов и их статусов, используя API<br/>
![img_129.png](img_129.png)<br/>
![img_130.png](img_130.png)<br/>
Получите состояние кластера elasticsearch, используя API<br/>
![img_131.png](img_131.png)
индексы в статусе Yellow потому что у них указано число реплик, но репликация не выполняется, поскольку нет других нод.<br/>
Удалите все индексы<br/>
curl --cacert /elasticsearch-8.2.3/config/certs/http_ca.crt -u elastic curl -X DELETE https://localhost:9200/ind-1?pretty <br/>
curl --cacert /elasticsearch-8.2.3/config/certs/http_ca.crt -u elastic curl -X DELETE https://localhost:9200/ind-2?pretty <br/> 
curl --cacert /elasticsearch-8.2.3/config/certs/http_ca.crt -u elastic curl -X DELETE https://localhost:9200/ind-3?pretty <br/> 
![img_132.png](img_132.png)<br/>
3. Используя API зарегистрируйте директорию как snapshot repository c именем netology_backup<br/>
![img_133.png](img_133.png)<br/>
Создайте индекс test с 0 реплик и 1 шардом и приведите в ответе список индексов.
![img_134.png](img_134.png)<br/>
Создайте snapshot состояния кластера elasticsearch<br/>
![img_136.png](img_136.png)<br/>
Приведите в ответе список файлов в директории со snapshotами<br/>
![img_135.png](img_135.png)<br/>
Удалите индекс test и создайте индекс test-2. Приведите в ответе список индексов<br/>
![img_137.png](img_137.png)<br/>
Восстановите состояние кластера elasticsearch из snapshot, созданного ранее<br/>
Приведите в ответе запрос к API восстановления и итоговый список индексов<br/>
![img_138.png](img_138.png)<br/>