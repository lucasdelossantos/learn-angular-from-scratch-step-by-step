FROM node:10.23.0-alpine3.9 as build

# Create app directory
WORKDIR /src/app/lafs

FROM build as dep
# Install app dependencies
RUN apk update && apk add --no-cache bash
COPY package*.json ./
RUN npm install -g @angular/cli@v6-lts
RUN npm install
COPY . .

FROM dep as expose 
EXPOSE 4200
CMD ng serve --host 0.0.0.0