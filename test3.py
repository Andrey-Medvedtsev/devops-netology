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
for i in hosts:
    if hosts[i] != hosts_new[i]:
        print(f'[ERROR] {i} IP mismatch: {hosts[i]} - {hosts_new[i]}')
json_hosts = json.dumps(hosts_new)
with open('json_file.json', 'w') as file_json:
    json.dump(json_hosts, file_json, indent=2)
yaml_hosts = yaml.dump(hosts_new)
with open('yaml_file.yaml', 'w') as file_yaml:
    yaml.safe_dump(yaml_hosts, file_yaml, indent=2)