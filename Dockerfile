FROM ubuntu:20.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git


RUN pip-3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod -R 775 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
