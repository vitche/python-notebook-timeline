FROM jupyter/base-notebook
USER root

# APT packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git
RUN apt install -y graphviz
RUN apt install -y build-essential

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

# HyperShell CLI packages
RUN npm install -g git+https://github.com/vitche/nodejs-hypershell-cli.git

# Sentiment Analyzer CLI packages
RUN npm install -g git+https://github.com/vitche/nodejs-onion-redis-sentiment-analyser-session.git

# Other (new)
RUN pip install scikit-image
RUN pip install ipyparallel

COPY processes.sh /usr/local/bin/
CMD ["processes.sh"]
