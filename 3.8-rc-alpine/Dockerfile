FROM python:3.8-rc-alpine

label "com.github.actions.name"="GitHub Action for Python 3.8-rc"
label "com.github.actions.description"="Run Python 3.8-rc code"
label "com.github.actions.icon"="terminal"
label "com.github.actions.color"="purple"

label "repository"="https://github.com/cmccandless/github-action-python"
label "homepage"="https://github.com/cmccandless/github-action-python"
label "maintainer"="cmccandless"

RUN apk add --no-cache bash

RUN pip install --upgrade pip
RUN pip install flake8
RUN pip install pytest
RUN python --version ; pip --version ; flake8 --version ; pytest --version

COPY * /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
