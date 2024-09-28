FROM node:16-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
FROM node:16-alpine
WORKDIR /app
RUN npm install -g @medusajs/medusa-cli
COPY --from=build /app .
EXPOSE 8080
CMD medusa migrations run && npm run start