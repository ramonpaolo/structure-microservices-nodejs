FROM node:14.17-alpine

LABEL maintainer "Ramon Paolo Maran"

WORKDIR /app

EXPOSE 3000

COPY ./services/user/ ./

RUN yarn && yarn build

CMD ["yarn", "start"]