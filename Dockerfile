FROM node:12.13.0
LABEL maintainer="Cai He Ping <1670341607@qq.com>"
RUN mkdir -p /home/www/cms-api
WORKDIR /home/www/cms-api
COPY . /home/www/cms-api
RUN npm install
EXPOSE 7001
ENTRYPOINT ["npm", "run"]
CMD ["dev"]