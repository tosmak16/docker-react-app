FROM node:10.16.0-slim as node-base

WORKDIR /usr/src/app/

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=node-base /usr/src/app/build /usr/share/nginx/html