FROM node:10.13.0-alpine


# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY src .
RUN rm -f yarn.lock && npm -g install yarn && yarn && yarn build

ENV HOST 0.0.0.0
ENV AGGREGATOR_URL http://localhost:8000
EXPOSE 3000

# # start command
COPY ./entrypoint.sh ./
ENTRYPOINT [ "./entrypoint.sh" ]
