let express = require('express')
let router = express.Router()

let deptModule = require('./api/deptModule')
let menuModule = require('./api/menuModule')
let postModule = require('./api/postModule')
let userModule = require('./api/userModule')

router.get('/', (req, res) => {
    res.send('express启动成功!');
})

router.get('/getDeptList', deptModule.getDeptList)
router.get('/getDeptListWithPagination', deptModule.getDeptListWithPagination)

router.get('/getMenuList', menuModule.getMenuList)
router.get('/getMenuListWithPagination', menuModule.getMenuListWithPagination)

router.get('/getPostList', postModule.getPostList)
router.get('/getPostListWithPagination', postModule.getPostListWithPagination)

router.post('/insertUser', userModule.insertUser);
router.post('/updateUser', userModule.updateUser);
router.post('/removeUser', userModule.deleteUser);
router.get('/getUserListWithPagination', userModule.getUserListWithPagination);
router.get('/getUserById/:userId', userModule.getUserById);


module.exports = router
