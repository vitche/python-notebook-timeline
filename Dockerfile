FROM jupyter/base-notebook
USER root
# APT packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git
RUN apt install -y graphviz
# PIP packages
RUN pip install pandas numpy scipy matplotlib plotly sklearn graphviz beautifulsoup4 bs4 hide_code
# Vitche packages
RUN pip install git+https://github.com/vitche/python-storage-timeline-client.git
RUN pip install git+https://github.com/vitche/python-compute-graph.git --upgrade
# Pysyun packages
RUN pip install git+https://github.com/pysyun/pysyun-timeline.git --upgrade
RUN pip install git+https://github.com/pysyun/pysyun-corpora.git --upgrade
# Jupyter packages
RUN jupyter nbextension install --py hide_code
RUN jupyter nbextension enable --py hide_code
RUN jupyter serverextension enable --py hide_code
# Other (new)
RUN pip install scikit-image
RUN npm install -g git+https://github.com/vitche/nodejs-hypershell-cli.git
