FROM nvidia/cuda:12.6.3-base-ubuntu20.04
ENV DEBIAN_FRONTEND noninteractive

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN apt-get update -y && \
	apt-get install -y aria2 libgl1 libglib2.0-0 wget git git-lfs  python3.12 python-venv python3-pip python-is-python3 && \
	adduser --disabled-password --uid 568 --group --system --gecos '' user && \
	mkdir /data && \
	chown -R user:user /data && \
	chown user:user /usr/bin/entrypoint.sh && \
	chmod  +x /usr/bin/entrypoint.sh


WORKDIR /data
USER user

#ENTRYPOINT tail -f /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 8188
