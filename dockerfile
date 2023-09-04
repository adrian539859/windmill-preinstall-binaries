FROM ghcr.io/windmill-labs/windmill:1.147.3	

RUN apt-get update 

RUN apt-get install -y libasound2 fonts-liberation libatk-bridge2.0-0 libatk1.0-0 libcairo2 libcups2 libdrm2 libgbm1 libgtk-3-0 libnspr4 libnss3 libu2f-udev libvulkan1 xdg-utils

RUN apt-get install -y wget gnupg2

RUN wget https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.90-1_amd64.deb

RUN dpkg -i google-chrome-stable_114.0.5735.90-1_amd64.deb

RUN wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip

RUN mv chromedriver /usr/bin/chromedriver

RUN apt-get update \
  &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN TZ=Asia/Hong_Kong \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata 


CMD ["windmill"]
