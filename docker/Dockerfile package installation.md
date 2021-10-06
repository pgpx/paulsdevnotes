# Dockerfile package installation

```Dockerfile
RUN apt update && apt install -y jq && rm -rf /var/lib/apt/lists/*
```