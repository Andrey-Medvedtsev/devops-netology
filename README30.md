Выполнена подготовка к выполнению, виртуальное окружение запускается<br/>
![img_202.png](img_202.png)
Основная часть<br/>
1,2. Выполнено<br/>
3. Заполните файл в соответствии с требованиями ansible так, чтобы он выполнял основную задачу: module должен создавать текстовый файл на удалённом хосте по пути, определённом в параметре path, с содержимым, определённым в параметре content<br/>
![img_203.png](img_203.png)
![img_204.png](img_204.png)
4. Проверьте module на исполняемость локально<br/>
![img_201.png](img_201.png)
![img_205.png](img_205.png)
5. Напишите single task playbook и используйте module в нём.<br/>
![img_206.png](img_206.png)
6. Проверьте через playbook на идемпотентность.<br/>
![img_209.png](img_209.png)
7. <br/>![img_210.png](img_210.png)<br/>
8. Инициализируйте новую collection<br/>
![img_211.png](img_211.png)
9. В данную collection перенесите свой module в соответствующую директорию.<br/>
![img_212.png](img_212.png)
10, 11. Single task playbook преобразуйте в single task role и перенесите в collection. У role должны быть default всех параметров module. Создайте playbook для использования этой role.<br/>
![img_213.png](img_213.png)


12. https://github.com/Andrey-Medvedtsev/my_own_collection/tree/1.0.0<br/>
13. ![img_214.png](img_214.png)<br/>
14. ![img_218.png](img_218.png)<br/>
15. ![img_216.png](img_216.png)<br/>
16. ![img_217.png](img_217.png)<br/>
17. https://github.com/Andrey-Medvedtsev/my_own_collection/tree/1.0.0<br/>