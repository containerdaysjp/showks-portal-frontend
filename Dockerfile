FROM node:10.14.2-alpine

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY src .
RUN npm install yarn && npm run build

ENV HOST 0.0.0.0
ENV AGGREGATOR_URL http://localhost:8000
EXPOSE 3000

# # start command
COPY ./entrypoint.sh ./
ENTRYPOINT [ "./entrypoint.sh" ]
