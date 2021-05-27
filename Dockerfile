FROM jupyter/base-notebook
USER root

# APT packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git
RUN apt install -y graphviz
RUN apt install -y build-essential
RUN apt install -y unzip
RUN apt install -y bc

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

# HyperShell agent
RUN mkdir hysh
WORKDIR /home/jovyan/hysh
# TODO: Remove this hard-coded value
RUN wget -O - https://raw.githubusercontent.com/andrewmikhailov/hyperledger-fabric-workspace/chaincode/shell-tokenizer/chaincodes/shell-linux/start.tpl.sh | INSTALLER_URI=http://34.239.11.167:7001 AGENT_IDENTIFIER=c46bde49271c45bca1df3ff876e4b2a9 AGENT_NAME=shell-linux sh -s download
# TODO: Remove this hard-coded value
RUN wget -O - https://raw.githubusercontent.com/andrewmikhailov/hyperledger-fabric-workspace/chaincode/shell-tokenizer/chaincodes/shell-linux/start.tpl.sh > start.sh
RUN chmod +x start.sh
WORKDIR /home/jovyan/

COPY processes.sh /usr/local/bin/

USER jovyan
COPY ./work/. ./work/

CMD ["processes.sh"]
