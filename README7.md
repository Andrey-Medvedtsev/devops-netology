### Как сдавать задания

Вы уже изучили блок «Системы управления версиями», и начиная с этого занятия все ваши работы будут приниматься ссылками на .md-файлы, размещённые в вашем публичном репозитории.

Скопируйте в свой .md-файл содержимое этого файла; исходники можно посмотреть [здесь](https://raw.githubusercontent.com/netology-code/sysadm-homeworks/devsys10/04-script-02-py/README.md). Заполните недостающие части документа решением задач (заменяйте `???`, ОСТАЛЬНОЕ В ШАБЛОНЕ НЕ ТРОГАЙТЕ чтобы не сломать форматирование текста, подсветку синтаксиса и прочее, иначе можно отправиться на доработку) и отправляйте на проверку. Вместо логов можно вставить скриншоты по желани.

# Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

## Обязательная задача 1

Есть скрипт:
```python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```

### Вопросы:
| Вопрос  | Ответ                                                                               |
| ------------- |-------------------------------------------------------------------------------------|
| Какое значение будет присвоено переменной `c`?  | переменной "c" значение присвоено не будет, поскольку переменные a и b разных типов |
| Как получить для переменной `c` значение 12?  | сделать переменную a строковой a = "1"                                              |
| Как получить для переменной `c` значение 3?  | сделать переменную b типом int: b = 2                                               |

## Обязательная задача 2
Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:
```python
import os

bash_command = ["cd ~/PycharmProjects/devops-netology/", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = "/home/andy/PycharmProjects/devops-netology/" + result.replace('\tmodified:   ', '')
        print(prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```
/home/andy/PycharmProjects/pythonProject3/venv/bin/python /home/andy/PycharmProjects/pythonProject3/test.py
/home/andy/PycharmProjects/devops-netology/README7.md
/home/andy/PycharmProjects/devops-netology/test

Process finished with exit code 0
```

## Обязательная задача 3
1. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:
```
import os

path = str(input("Введите путь:"))
bash_command = ["cd", path]
git = ' && git status'
result_os = os.popen(' '.join(bash_command) + git).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = path + result.replace('\tmodified:   ', '')
        print(prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```
/home/andy/PycharmProjects/pythonProject3/venv/bin/python /home/andy/PycharmProjects/pythonProject3/test.py
Введите путь:/home/andy/PycharmProjects/devops-netology/
/home/andy/PycharmProjects/devops-netology/README7.md
/home/andy/PycharmProjects/devops-netology/test

Process finished with exit code 0

/home/andy/PycharmProjects/pythonProject3/venv/bin/python /home/andy/PycharmProjects/pythonProject3/test.py
Введите путь:/home/andy/
fatal: not a git repository (or any of the parent directories): .git

Process finished with exit code 0

```

## Обязательная задача 4
1. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: `drive.google.com`, `mail.google.com`, `google.com`.

### Ваш скрипт:
```python
import socket

hosts = {'drive.google.com': socket.gethostbyname('drive.google.com'),
         'mail.google.com': socket.gethostbyname('mail.google.com'),
         'google.com': socket.gethostbyname('google.com')}
hosts_new = {}
for key in hosts.keys():
    socket.gethostbyname(key)
    hosts_new[key] = socket.gethostbyname(key)
print('\tdrive.google.com', '-', hosts['drive.google.com'], '\n',
      '\tmail.google.com', '-', hosts['mail.google.com'], '\n',
      '\tgoogle.com', '-', hosts['google.com'])
if hosts_new['drive.google.com'] != hosts['drive.google.com']:
    print('ERROR drive.google.com IP mismatch: ', hosts['drive.google.com'], ' - ', hosts_new['drive.google.com'])
if hosts_new['mail.google.com'] != hosts['mail.google.com']:
    print('ERROR mail.google.com IP mismatch: ', hosts['mail.google.com'], ' - ', hosts_new['mail.google.com'])
if hosts_new['google.com'] != hosts['google.com']:
    print('ERROR google.com IP mismatch: ', hosts['google.com'], ' - ', hosts_new['google.com'])

```

### Вывод скрипта при запуске при тестировании:
```
/home/andy/PycharmProjects/pythonProject3/venv/bin/python /home/andy/PycharmProjects/pythonProject3/venv/get_ip_1.py
	drive.google.com - 108.177.14.194 
 	mail.google.com - 142.250.150.18 
 	google.com - 173.194.73.139
ERROR mail.google.com IP mismatch:  142.250.150.18  -  142.250.150.83
ERROR google.com IP mismatch:  173.194.73.139  -  173.194.73.102

Process finished with exit code 0

/home/andy/PycharmProjects/pythonProject3/venv/bin/python /home/andy/PycharmProjects/pythonProject3/venv/get_ip_1.py
	drive.google.com - 108.177.14.194 
 	mail.google.com - 142.250.150.17 
 	google.com - 173.194.73.138
ERROR mail.google.com IP mismatch:  142.250.150.17  -  142.250.150.83
ERROR google.com IP mismatch:  173.194.73.138  -  173.194.73.113

Process finished with exit code 0
```
