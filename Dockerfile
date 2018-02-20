FROM node
LABEL maintainer="Iciolus kevin@soloitguy.com"

ENV CHROME_DRIVER_VERSION 2.20
RUN apt-get update && \
    apt-get install -y git curl build-essential vim libfontconfig1 libgconf-2-4 libnss3 nodejs npm wget
RUN apt-get install -y unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/
RUN chmod ugo+rx /usr/bin/chromedriver

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y \
        google-chrome-stable
RUN useradd -ms /bin/bash builder
USER builder        
