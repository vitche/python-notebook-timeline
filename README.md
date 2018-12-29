# python-notebook-timeline

## About
This is a Python Notebook Docker container with a data-science toolkit needed to analyze Storage.Timeline data.

## Installation
To permanently set-up the Docker container:

```console
docker run -dit --restart always --name python-notebook-timeline -p 8890:8888 vitche/python-notebook-timeline
```

## Examples

To import the Storage.Timeline connector:

```python
from storage_timeline_client import Storage
```

To load the time-lines list:

```python
schema = Storage('{ServerURI}').schema('{SchemaName}')
timeLines = schema.list()
print(timeLines)
```
