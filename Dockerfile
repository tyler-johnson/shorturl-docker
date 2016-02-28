FROM mhart/alpine-node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app
COPY . /usr/src/app/
RUN [ "npm", "install" ]

# run app
EXPOSE 80
CMD [ "npm", "start" ]
