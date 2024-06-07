# Build local monorepo image
# docker build --no-cache -t  flowise .

# Run image
# docker run -d -p 3000:3000 flowise

FROM --platform=linux/amd64 node:18-alpine
RUN apk add --update libc6-compat python3 make g++
# needed for pdfjs-dist
RUN apk add --no-cache build-base cairo-dev pango-dev

# Install Chromium
RUN apk add --no-cache chromium

#install PNPM globaly
RUN npm install -g pnpm

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

ENV FLOWISE_USERNAME=lunaraspect
ENV FLOWISE_PASSWORD=lunaraspect1234

ENV DATABASE_TYPE=mysql
ENV DATABASE_PORT=3306
ENV DATABASE_HOST=34.83.103.129
ENV DATABASE_NAME=flowiseai
ENV DATABASE_USER=flowiseai
ENV DATABASE_PASSWORD="R/y`1h)gi9@x:Y}I"

WORKDIR /usr/src

# Copy app source
COPY . .

RUN pnpm install

RUN pnpm build

EXPOSE 3000

CMD [ "pnpm", "start" ]
