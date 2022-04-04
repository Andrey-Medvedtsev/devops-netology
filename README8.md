### Как сдавать задания

Вы уже изучили блок «Системы управления версиями», и начиная с этого занятия все ваши работы будут приниматься ссылками на .md-файлы, размещённые в вашем публичном репозитории.

Скопируйте в свой .md-файл содержимое этого файла; исходники можно посмотреть [здесь](https://raw.githubusercontent.com/netology-code/sysadm-homeworks/devsys10/04-script-03-yaml/README.md). Заполните недостающие части документа решением задач (заменяйте `???`, ОСТАЛЬНОЕ В ШАБЛОНЕ НЕ ТРОГАЙТЕ чтобы не сломать форматирование текста, подсветку синтаксиса и прочее, иначе можно отправиться на доработку) и отправляйте на проверку. Вместо логов можно вставить скриншоты по желани.

# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"


## Обязательная задача 1
Мы выгрузили JSON, который получили через API запрос к нашему сервису:
```
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            }
            { "name" : "second",
            "type" : "proxy",
            "ip : 71.78.22.43
            }
        ]
    }
```
  Нужно найти и исправить все ошибки, которые допускает наш сервис
```
import json


str_json = """
{ "info" : "Sample JSON output from our service"\t,
    "elements": [
        { "name" : "first",
        "type" : "server",
        "ip" : "7175"
        },
        { "name" : "second",
        "type" : "proxy",
        "ip" : "71.78.22.43"
        }
    ]
 }"""
data = json.loads(str_json)
print(data)

```
Вывод
```
{'info': 'Sample JSON output from our service', 'elements': [{'name': 'first', 'type': 'server', 'ip': '7175'}, {'name': 'second', 'type': 'proxy', 'ip': '71.78.22.43'}]}

Process finished with exit code 0
```

## Обязательная задача 2
В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: `{ "имя сервиса" : "его IP"}`. Формат записи YAML по одному сервису: `- имя сервиса: его IP`. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

### Ваш скрипт:
```python
import json
import socket
import yaml

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
json_hosts = json.dumps(hosts_new)
with open('json_file.json', 'w') as file_json:
    json.dump(json_hosts, file_json, indent=2)
yaml_hosts = yaml.dump(hosts_new)
with open('yaml_file.yaml', 'w') as file_yaml:
    yaml.safe_dump(yaml_hosts, file_yaml, indent=2)
if hosts_new['drive.google.com'] != hosts['drive.google.com']:
    print('ERROR drive.google.com IP mismatch: ', hosts['drive.google.com'], ' - ', hosts_new['drive.google.com'])
if hosts_new['mail.google.com'] != hosts['mail.google.com']:
    print('ERROR mail.google.com IP mismatch: ', hosts['mail.google.com'], ' - ', hosts_new['mail.google.com'])
if hosts_new['google.com'] != hosts['google.com']:
    print('ERROR google.com IP mismatch: ', hosts['google.com'], ' - ', hosts_new['google.com'])

```

### Вывод скрипта при запуске при тестировании:
```
/usr/bin/python3.9 /home/andy/PycharmProjects/devops-netology/test.py
	drive.google.com - 64.233.161.194 
 	mail.google.com - 64.233.163.19 
 	google.com - 74.125.131.113
ERROR mail.google.com IP mismatch:  64.233.163.19  -  64.233.163.18
ERROR google.com IP mismatch:  74.125.131.113  -  74.125.131.101

Process finished with exit code 0
```

### json-файл(ы), который(е) записал ваш скрипт:
```json
"{\"drive.google.com\": \"64.233.161.194\", \"mail.google.com\": \"64.233.163.18\", \"google.com\": \"74.125.131.101\"}"
после очередного выполнения:
"{\"drive.google.com\": \"64.233.162.194\", \"mail.google.com\": \"64.233.164.19\", \"google.com\": \"173.194.221.102\"}"
```

### yml-файл(ы), который(е) записал ваш скрипт:
```yaml
'drive.google.com: 64.233.161.194

  google.com: 74.125.131.101

  mail.google.com: 64.233.163.18

  '
после очередного выполнения:
  
'drive.google.com: 64.233.162.194

  google.com: 173.194.221.102

  mail.google.com: 64.233.164.19

  '

```
