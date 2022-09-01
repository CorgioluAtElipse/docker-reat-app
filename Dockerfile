FROM node:16-alpine as builder
RUN echo "Building...."

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
RUN echo "Production phase"
COPY --from=builder  /app/build /usr/share/nginx/html