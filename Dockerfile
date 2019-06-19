FROM node:10.16.0 as builder

# Create app directory
WORKDIR /usr/src/app

COPY src .

# Build devDependency for compliling assets for yarn build
RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build

# Remove packages you don't need for app in production
RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM node:10.16.0-alpine

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY --from=builder /usr/src/app  .

ENV HOST 0.0.0.0
ENV AGGREGATOR_URL http://localhost:8000
EXPOSE 3000

# # start command
COPY ./entrypoint.sh ./
ENTRYPOINT [ "./entrypoint.sh" ]
