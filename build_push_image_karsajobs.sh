#!/bin/bash

# Build Docker image dari Dockerfile
docker build -t karsajobs:latest .

# Melihat daftar image di lokal
docker images

# Tag image agar sesuai dengan format GitHub Container Registry
docker tag karsajobs:latest ghcr.io/maviism/karsajobs:latest

# Login ke GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u maviism --password-stdin

# Push image ke GitHub Container Registry
docker push ghcr.io/maviism/karsajobs:latest

# Melihat daftar image di GitHub Container Registry
curl https://ghcr.io/v2/maviism/karsajobs

# Pesan sukses
echo "Image telah di push ke GitHub Container Registry"


