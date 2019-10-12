FROM containers.ssii.com/base/nodejs:lts-alpine AS BUILDER
# ENV PORT 8080
# EXPOSE 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
RUN yarn build
# RUN npm install
# COPY . .

# CMD ["npm", "start"]

FROM containers.ssii.com/base/nginx:alpine
COPY --from=BUILDER dist/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
