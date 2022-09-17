1. Сделать Freestyle Job, который будет запускать ansible-playbook из форка репозитория<br/>
![img_230.png](img_230.png)
2. Сделать Declarative Pipeline, который будет выкачивать репозиторий с плейбукой и запускать её<br/>
![img_232.png](img_232.png)
![img_231.png](img_231.png)
3. Перенести Declarative Pipeline в репозиторий в файл Jenkinsfile<br/>
![img_233.png](img_233.png)
4. Перенастроить Job на использование Jenkinsfile из репозитория<br/>
![img_234.png](img_234.png)
5, 6. Создать Scripted Pipeline, наполнить его скриптом из pipeline. Заменить credentialsId на свой собственный<br/>
![img_235.png](img_235.png)


7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл ScriptedJenkinsfile<br/>
при выполнении возникла ошибка <br/>
![img_236.png](img_236.png)<br/>
добавил пользователя jenkins в sudoers, ошибка ушла<br/>
![img_237.png](img_237.png)<br/>
других ошибок не было, сборка прошла успешно<br/>
![img_238.png](img_238.png)
![img_239.png](img_239.png)
8. Отправить ссылку на репозиторий в ответе <br/>
https://github.com/Andrey-Medvedtsev/example-playbook.git
