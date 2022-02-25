FROM node:17.0.1-bullseye-slim

WORKDIR /project

RUN npm install -g @angular/cli@13

COPY package.json package-lock.json ./

RUN npm install

COPY . .

CMD ["ng","serve","--host","0.0.0.0"]
