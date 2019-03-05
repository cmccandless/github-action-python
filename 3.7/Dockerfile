FROM python:3.7-alpine

label "com.github.actions.name"="GitHub Action for Python 3.7"
label "com.github.actions.description"="Run Python 3.7 code"
label "com.github.actions.icon"="terminal"
label "com.github.actions.color"="purple"

label "repository"="https://github.com/cmccandless/github-action-python"
label "homepage"="https://github.com/cmccandless/github-action-python"
label "maintainer"="cmccandless"

# Install bash
RUN apk add --no-cache bash

# Install pip
RUN pip install --upgrade pip
# Install default packages
RUN pip install flake8
RUN pip install pytest

# Print version infos
RUN python --version
RUN pip --version
RUN flake8 --version
RUN pytest --version

# Setup script directory
COPY * /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
