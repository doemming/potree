FROM node:18-alpine
WORKDIR /app
COPY . /app
RUN npm install 
EXPOSE 1234
CMD ["npm", "start"]
