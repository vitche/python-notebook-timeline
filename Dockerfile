FROM jupyter/base-notebook
USER root
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install nano -y \
    && apt-get install -y git

RUN pip install git+https://github.com/vitche/python-storage-timeline-client.git \
    && pip install git+https://github.com/pysyun/pysyun-timeline.git --upgrade

RUN pip install numpy pandas scipy matplotlib requests beautifulsoup4 plotly

EXPOSE 8888
