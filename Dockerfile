FROM node:lts AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:latest
RUN rm /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/libs /usr/share/nginx/html/potree/libs
COPY --from=builder /app/build /usr/share/nginx/html/potree/build
COPY --from=builder /app/ept_ply.html /usr/share/nginx/html/potree
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]