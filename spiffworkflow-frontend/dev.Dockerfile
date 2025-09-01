FROM node:22.19.0-trixie-slim AS base

WORKDIR /app

CMD ["npm", "run", "start"]
