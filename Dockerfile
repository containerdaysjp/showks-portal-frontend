FROM node:10.13.0-alpine

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY src .
RUN rm -rf yarn.lock && npm -g install yarn && yarn && yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "yarn", "start" ]
