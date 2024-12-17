FROM kubespheredev/builder-base:v4.1.0

# python:3.10.12 pip:22.0.2
RUN apt-get install -y python3 pip && apt-get clean autoclean && ln -s /usr/bin/python3 /usr/bin/python

CMD ["python","--version"]
