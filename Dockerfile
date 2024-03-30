FROM python:3.9-buster
MAINTAINER "nathan"

#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone
ADD https://github.com/jianchang512/stt/archive/refs/tags/v0.92.tar.gz /opt/
WORKDIR /opt/stt
SHELL ["/bin/bash", "-c"]
RUN python -m venv venv && \
    source ./venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
ADD stt-base.tar.gz /opt/stt/models
ADD ffmpeg-git-amd64-static.tar.gz /opt/
ENV PATH=/opt/ffmpeg-git-amd64-static/:$PATH
COPY run.sh /opt/stt/
CMD ["bash","-x","run.sh" ]
