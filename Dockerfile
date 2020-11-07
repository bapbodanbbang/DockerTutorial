FROM node:10

WORKDIR /usr/src/app

# CACHED를 사용하여 만약 종속 성 변화가 있을시에만 처음부터 설치하되, 없으면 종속성은 캐쉬를 사용하고 소스코드만 변경하도록 해서 더 효율적인 실행이 가능하다!
# Volume 사용시 이미지 복사를 할 필요가 없으므로 사용 불필요!
COPY package.json ./

RUN npm install

COPY ./ ./

CMD [ "node", "./bin/www" ]

#Volume 사용법 : docker run -p local port : container port -v /usr/src/app/node_modules -v $(pwd):/usr/src/app image name