FROM node:latest

ARG DOCKER_HOST_USER_ID
ARG DOCKER_HOST_USER_GROUP_ID
RUN test -n "$DOCKER_HOST_USER_ID" && test -n "$DOCKER_HOST_USER_GROUP_ID"

RUN apt-get update && apt-get install -y curl wget apt-transport-https \
	&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
	&& apt-get install -y wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
	&& npm install -g pa11y-ci@2.3.0 depcheck --unsafe-perm \
	&& npm install -g pa11y-ci-reporter-html@2.0.2 depcheck --unsafe-perm \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y \
    && rm -rf /src/*.deb

RUN groupadd --gid ${DOCKER_HOST_USER_GROUP_ID} mapped-user
RUN useradd --gid ${DOCKER_HOST_USER_GROUP_ID} --uid ${DOCKER_HOST_USER_ID} --create-home --shell /bin/bash mapped-user
USER mapped-user
	
WORKDIR /home/mapped-user