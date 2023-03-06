# Base
FROM node:18-alpine AS base

WORKDIR /agriculture

RUN apk update && apk add vim

# Builder
FROM base AS builder

COPY package.json package-lock.json tsconfig.json babel.config.js ./

RUN npm ci

COPY ./src ./src

RUN npm run build

RUN npm prune --production # Remove dev dependencies


# Prod
FROM base AS release

COPY --from=builder /agriculture/node_modules ./node_modules
COPY --from=builder /agriculture/dist ./dist

USER node

CMD ["node", "./dist/index.js"]