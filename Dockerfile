FROM node:13.8-alpine

EXPOSE 3000
ENV NODE_ENV=production REACT_APP_API_URL=http://localhost:4000/graphql

COPY package*.json ./

RUN yarn global add serve
RUN yarn install --prod && yarn cache clean 

COPY . .

RUN yarn build

CMD ["serve", "-s", "build", "-l", "3000"]
