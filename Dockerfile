FROM node

WORKDIR /usr/src/app
RUN pwd
RUN ls
COPY package.json .
RUN npm install
COPY . ./
EXPOSE 3000
CMD [ "node", "index.js" ]
