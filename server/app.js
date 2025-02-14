let express = require('express')
let app = express()
let cors = require('cors')
let bodyParser = require('body-parser')
let router = require('./router')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cors())
app.use('/api', router)

app.listen(8888, () => {
    console.log('服务器启动成功。 ---> http://127.0.0.1:8888/api');
})
