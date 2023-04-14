FROM python:3.9.7-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev
RUN wget https://www.johnvansickle.com/ffmpeg/old-releases/ffmpeg-4.3.2-amd64-static.tar.xz && tar -xf ffmpeg-4.3.2-amd64-static.tar.xz && mv ffmpeg-*-static/ffmpeg /usr/local/bin/ffmpeg && rm -rf ffmpeg-*
RUN apt -qq install -y mediainfo
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
