FROM node:10-alpine
WORKDIR /api
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]
ENTRYPOINT ["node", "index.js"]