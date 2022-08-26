FROM node:alpine
RUN mkdir -p /nodeApp
WORKDIR /nodeApp
COPY . /nodeApp
RUN npm install
CMD [ "node", "nodeApp.js" ]