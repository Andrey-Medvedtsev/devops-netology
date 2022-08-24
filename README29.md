В рамках основной части необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить следующий жизненный цикл:<br/>
&ensp;    Open -> On reproduce <br/>
&ensp;    On reproduce <-> Open, Done reproduce<br/>
&ensp;    Done reproduce -> On fix<br/>
&ensp;    On fix <-> On reproduce, Done fix<br/>
&ensp;    Done fix -> On test<br/>
&ensp;    On test <-> On fix, Done<br/>
&ensp;    Done <-> Closed, Open<br/>
![img_197.png](img_197.png)
Остальные задачи должны проходить по упрощённому workflow:<br/>
&ensp;      Open -> On develop<br/>
&ensp;      On develop <-> Open, Done develop<br/>
&ensp;      Done develop -> On test<br/>
&ensp;      On test <-> On develop, Done<br/>
&ensp;      Done <-> Closed, Open<br/>

![img_196.png](img_196.png)
Создать задачу с типом epic, к ней привязать несколько задач с типом task, провести их по всему workflow до Done. <br/>
![img_191.png](img_191.png)
Перейти в scrum, запланировать новый спринт, состоящий из задач эпика и одного бага, стартовать спринт, провести задачи до состояния Closed. Закрыть спринт.<br/>
![img_192.png](img_192.png)
![img_193.png](img_193.png)
![img_195.png](img_195.png)

Если всё отработало в рамках ожидания - выгрузить схемы workflow для импорта в XML. Файлы с workflow приложить к решению задания.<br/>

Не нашёл как в проекте выполнить экспорт в xml, можно только отредактировать или удалить<br/>
![img_198.png](img_198.png)
в профиле их нет <br/>
![img_199.png](img_199.png)