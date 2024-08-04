# build stage

FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY . .

RUN npm install && npm run build

# deploy stage

FROM node:20-alpine AS deploy

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist .

EXPOSE 4000

CMD ["node", "dist/main.js"]
