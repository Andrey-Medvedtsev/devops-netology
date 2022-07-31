Подготовка к выполнению
1. Установите ansible версии 2.10 или выше.
![img_162.png](img_162.png)
2, 3. https://github.com/Andrey-Medvedtsev/netology-ansible <br/>

Основная часть<br/>
1. Попробуйте запустить playbook на окружении из test.yml, зафиксируйте какое значение имеет факт some_fact для указанного хоста при выполнении playbook'a.<br/>
![img_163.png](img_163.png)<br/>
2. Найдите файл с переменными (group_vars) в котором задаётся найденное в первом пункте значение и поменяйте его на 'all default fact'.<br/>
![img_164.png](img_164.png)<br/>
3, 4. Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.<br/>
Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.<br/>
![img_165.png](img_165.png)<br/>
5, 6. Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились следующие значения: для deb - 'deb default fact', для el - 'el default fact'.<br/>
Повторите запуск playbook на окружении prod.yml. Убедитесь, что выдаются корректные значения для всех хостов.<br/>
![img_166.png](img_166.png)<br/>


7.При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.<br/>
![img_167.png](img_167.png)
8.Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.<br/>
![img_168.png](img_168.png)
9.Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.<br/>
gather_facts - Gathers facts about remote hosts <br/>
![img_169.png](img_169.png)
10, 11. В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.<br/>
Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь что факты some_fact для каждого из хостов определены из верных group_vars.<br/>
![img_170.png](img_170.png)
12. https://github.com/Andrey-Medvedtsev/netology-ansible/tree/main/playbook