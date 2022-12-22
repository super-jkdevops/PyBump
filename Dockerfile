FROM python:3.11-slim

LABEL maintainer="Arie Lev <levinsonarie@gmail.com>" \
      description="Python version bumper"

RUN apt-get update && \
    apt-get install -y git
   
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null && \
    apt-get install apt-transport-https --yes && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install helm

WORKDIR package

COPY src src
COPY setup.py .
COPY LICENSE .
COPY README.rst .
COPY requirements.txt .
RUN python ./setup.py install

WORKDIR /

# clean package files
RUN rm -rf /package

# execute simle version test
RUN pybump --version
ENTRYPOINT ["pybump"]
