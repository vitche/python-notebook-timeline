# Start the HyperShell agent when the identifier is defined
if [ -z "$CHAINCODE_ID_NAME" ]
then
  echo "Skipping HyperShell agent due to having no identifier"
else
  cd /home/jovyan/hysh
  ./start.sh start &
  cd /home/jovyan
fi

# Start the notebook
start-notebook.sh
