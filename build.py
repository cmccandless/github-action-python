from jinja2 import Template, FileSystemLoader, Environment
import json
import os

with open('config.json') as f:
    config = json.load(f)

generated = ['.github/main.workflow']

templateLoader = FileSystemLoader(searchpath='./templates/')
templateEnv = Environment(
    loader=templateLoader,
    keep_trailing_newline=True,
)

workflow_template = templateEnv.get_template('main.workflow.j2')
os.makedirs('.github', exist_ok=True)
with open(os.path.join('.github', 'main.workflow'), 'w') as f:
    f.write(workflow_template.render(**config))
versions = config.pop('versions', [])

docker_template = templateEnv.get_template('Dockerfile.j2')
entrypoint_template = templateEnv.get_template('entrypoint.sh.j2')
for version in versions:
    os.makedirs(version, exist_ok=True)
    output = docker_template.render(version=version, **config)
    with open(os.path.join(version, 'Dockerfile'), 'w') as f:
        f.write(output)

    output = entrypoint_template.render(version=version, **config)
    with open(os.path.join(version, 'entrypoint.sh'), 'w') as f:
        f.write(output)

    generated.append(version)

with open('.generated', 'w') as f:
    f.writelines(f'{path}\n' for path in generated)
