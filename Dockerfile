FROM node

WORKDIR /usr/src/app
RUN pwd
RUN ls
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "node", "index.js" ]
