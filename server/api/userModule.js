let db = require('../db/index');

exports.insertUser = (req, res) => {
    const userData = req.body;
    const sql = `        INSERT INTO user (username, phone, posts, depts, menus)
        VALUES (?, ?, ?, ?, ?)
    `;
    const values = [userData.username, userData.phone, userData.posts, userData.depts, userData.menus];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error('Error inserting user:', err);
            return res.status(500).send({ status: 500, message: "错误：" + err.message });
        }
        res.send({
            status: 200,
            message: "用户新增成功",
            userId: result.insertId
        });
    });
};

exports.updateUser = (req, res) => {
    const userData = req.body;
    const sql = `        UPDATE user
        SET username = ?, phone = ?, posts = ?, depts = ?, menus = ?
        WHERE user_id = ?
    `;
    const values = [userData.username, userData.phone, userData.posts, userData.depts, userData.menus, userData.user_id];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error('Error updating user:', err);
            return res.status(500).send({ status: 500, message: "错误：" + err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).send({ status: 404, message: "用户未找到" });
        }
        res.send({
            status: 200,
            message: "用户更新成功"
        });
    });
};

exports.deleteUser = (req, res) => {
    const userId = req.body.userId;
    const sql = 'DELETE FROM user WHERE user_id = ?';
    db.query(sql, [userId], (err, result) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).send({status: 500, message: "错误：" + err.message});
        }
        if (result.affectedRows === 0) {
            return res.status(404).send({status: 404, message: "用户未找到"});
        }
        res.send({
            status: 200,
            message: "用户删除成功"
        });
    });
};

exports.getUserListWithPagination = (req, res) => {
    const obj = req.query;
    const pageNum = parseInt(obj.pageNum) || 1;
    const pageSize = parseInt(obj.pageSize) || 10;
    const offset = (pageNum - 1) * pageSize;

    let sql = 'SELECT * FROM user';
    sql += ` LIMIT ${offset}, ${pageSize}`;

    db.query(sql, (err, data) => {
        if (err) {
            return res.send({status: 500, message: "错误：" + err.message});
        }

        let countSql = 'SELECT COUNT(*) as total FROM user';

        db.query(countSql, (countErr, countData) => {
            if (countErr) {
                return res.send({status: 500, message: "错误：" + countErr.message});
            }

            const total = countData[0].total;
            const totalPages = Math.ceil(total / pageSize);

            res.send({
                status: 200,
                message: "success",
                data: {
                    list: data,
                    pageNum,
                    pageSize,
                    total,
                    totalPages
                }
            });
        });
    });
};

exports.getUserById = (req, res) => {
    const userId = req.params.userId;
    const sql = 'SELECT * FROM user WHERE user_id = ?';

    db.query(sql, [userId], (err, result) => {
        if (err) {
            return res.status(500).send({ status: 500, message: "错误：" + err.message });
        }
        if (result.length === 0) {
            return res.status(404).send({ status: 404, message: "用户未找到" });
        }
        res.send({
            status: 200,
            message: "用户详情获取成功",
            data: result[0]
        });
    });
};
