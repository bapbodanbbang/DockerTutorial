var express = require('express');
var router = express.Router();
var redis = require('redis');
var client = redis.createClient({
  //docker Compose사용시, https://가 아니라 redis-server 후, host옵션을 docker-compose.yml에 명시한 컨테이너 이름으로 한다.!!!!!
  host: "redis-server",
  //redis default port
  port: 6379
})

client.set("number",0);

/* GET home page. */
router.get('/', function(req, res, next) {
  client.get("number", (err,number) => {
    res.send("number : "+number);
    client.set("number", parseInt(number) + 1)
  })
});

module.exports = router;
