Основная часть
1. Создать в старой версии playbook файл requirements.yml и заполнить его<br/>
![img_183.png](img_183.png)<br/>

2. При помощи ansible-galaxy скачать себе эту роль.<br/>
![img_182.png](img_182.png)<br/>
Запустите molecule test, посмотрите на вывод команды.<br/>
![img_184.png](img_184.png)<br/>
3. Перейдите в каталог с ролью elastic-role и создайте сценарий тестирования по умолчаню при помощи molecule init scenario --driver-name docker.<br/>
![img_185.png](img_185.png)<br/>
4. Добавьте несколько разных дистрибутивов (centos:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.<br/>
![img_186.png](img_186.png)
5. Создайте новый каталог с ролью при помощи molecule init role --driver-name docker kibana-role<br/>
![img_187.png](img_187.png)
6. На основе tasks из старого playbook заполните новую role. Разнесите переменные между vars и default. Проведите тестирование на разных дистрибитивах (centos:7, centos:8, ubuntu).<br/>
![img_188.png](img_188.png)
7. Выложите все roles в репозитории. Проставьте тэги, используя семантическую нумерацию.<br/>
https://github.com/Andrey-Medvedtsev/netology_ansible_8.2/tree/v1.0.1/playbook <br/>
https://github.com/Andrey-Medvedtsev/elastic-role/tree/v1.0.1 <br/>
https://github.com/Andrey-Medvedtsev/kibana-role/tree/v1.0.1 <br/>
8. Добавьте roles в requirements.yml в playbook.<br/>
![img_189.png](img_189.png)<br/>
9. Переработайте playbook на использование roles.<br/>
![img_190.png](img_190.png)<br/>
10. Выложите playbook в репозиторий.<br/>
https://github.com/Andrey-Medvedtsev/netology_ansible_8.2/tree/v1.0.1/playbook <br/>
11. В ответ приведите ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.<br/>
https://github.com/Andrey-Medvedtsev/netology_ansible_8.2/tree/v1.0.1/playbook <br/>
https://github.com/Andrey-Medvedtsev/elastic-role/tree/v1.0.1 <br/>
https://github.com/Andrey-Medvedtsev/kibana-role/tree/v1.0.1 <br/>
Elasticsearch и Kibana не получается скачать, поэтому использовал локальную установку. На github дистрибутивы не выкладывал, кроме того файлы более 100 МБ Github не разрешает выкладывать.<br/>  