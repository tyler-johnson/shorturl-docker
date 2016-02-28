FROM mhart/alpine-node:latest

RUN apk update && apk upgrade \
	&& apk add --no-cache git make gcc g++ python \
	&& npm i npm@latest -g

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app
COPY . /usr/src/app/
RUN [ "npm", "install" ]

# run app
EXPOSE 80
CMD [ "npm", "start" ]
