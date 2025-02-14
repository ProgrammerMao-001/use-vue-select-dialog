let db = require('../db/index');

exports.getPostList = (req, res) => {
    let sql = 'SELECT * FROM post';
    db.query(sql, (err, data) => {
        if (err) {
            return res.send('错误：' + err.message);
        }
        res.send({
            status: 200,
            message: "success",
            data
        });
    });
}

exports.getPostListWithPagination = (req, res) => {
    let sql = 'SELECT * FROM post WHERE 1=1';
    let countSql = 'SELECT COUNT(*) as total FROM post WHERE 1=1';
    let obj = req.query;
    let conditions = [];

    if (obj.post_name) {
        sql += ' AND post_name LIKE ?';
        countSql += ' AND post_name LIKE ?';
        conditions.push(`%${obj.post_name}%`);
    }

    if (obj.post_code) {
        sql += ' AND post_code LIKE ?';
        countSql += ' AND post_code LIKE ?';
        conditions.push(`%${obj.post_code}%`);
    }

    if (obj.status !== undefined) {
        sql += ' AND status = ?';
        countSql += ' AND status = ?';
        conditions.push(obj.status);
    }

    const pageNum = parseInt(obj.pageNum) || 1;
    const pageSize = parseInt(obj.pageSize) || 10;
    const offset = (pageNum - 1) * pageSize;

    sql += ` LIMIT ${offset}, ${pageSize}`;

    db.query(sql, conditions, (err, data) => {
        if (err) {
            return res.send({ status: 500, message: "错误：" + err.message });
        }

        db.query(countSql, conditions, (countErr, countData) => {
            if (countErr) {
                return res.send({ status: 500, message: "错误：" + countErr.message });
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
