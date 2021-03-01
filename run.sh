docker run -dit --restart always --name python-notebook-timeline -p 8888:8888 -p 9801-9910:9801-9910 --env CHAINCODE_ID_NAME=c46bde49271c45bca1df3ff876e4b2a9 --env CHAINCODE_VERSION=0.0.1 --env PEER_ADDRESS=92.119.223.177:7052 vitche/python-notebook-timeline
# Container with a "test" prefix
# docker run -dit --restart always --name python-notebook-timeline-test -p 8889:8888 -p 9801-9910:9801-9910 --env CHAINCODE_ID_NAME=c46bde49271c45bca1df3ff876e4b2a9 --env CHAINCODE_VERSION=0.0.1 --env PEER_ADDRESS=92.119.223.177:7052 vitche/python-notebook-timeline
