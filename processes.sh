# Start the HyperShell agent when the identifier is defined
if [ -z "$CHAINCODE_ID_NAME" ]
then
  echo "Skipping HyperShell agent due to having no identifier"
else
  ./start.sh start &
fi

# Start the notebook
start-notebook.sh
