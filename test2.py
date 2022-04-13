import json
import yaml

with open('json_file', 'r') as file:
    data_json = json.load(file)
print(data_json)
print(type(data_json))

with open('yaml_file', 'r') as file:
    data_yaml = yaml.full_load(file)
print(data_yaml)

