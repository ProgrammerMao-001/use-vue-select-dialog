let db = require('../db/index');

exports.getDeptList = (req, res) => {
    let sql = 'SELECT * FROM dept WHERE 1=1';
    let obj = req.query;
    let conditions = [];

    if (obj.dept_name) {
        sql += ` AND dept_name LIKE ?`;
        conditions.push(`%${obj.dept_name}%`);
    }

    if (obj.create_by) {
        sql += ` AND create_by LIKE ?`;
        conditions.push(`%${obj.create_by}%`);
    }

    if (obj.status) {
        sql += ` AND status = ?`;
        conditions.push(obj.status);
    }

    if (obj.node_type) {
        sql += ` AND node_type = ?`;
        conditions.push(obj.node_type);
    }

    db.query(sql, conditions, (err, data) => {
        if (err) {
            return res.send({ status: 500, message: "错误：" + err.message });
        }
        res.send({
            status: 200,
            message: "success",
            data
        });
    });
}

exports.getDeptListWithPagination = (req, res) => {
    let sql = 'SELECT * FROM dept WHERE 1=1';
    let countSql = 'SELECT COUNT(*) as total FROM dept WHERE 1=1';
    let obj = req.query;
    let conditions = [];

    if (obj.dept_name) {
        sql += ` AND dept_name LIKE ?`;
        countSql += ` AND dept_name LIKE ?`;
        conditions.push(`%${obj.dept_name}%`);
    }

    if (obj.create_by) {
        sql += ` AND create_by LIKE ?`;
        countSql += ` AND create_by LIKE ?`;
        conditions.push(`%${obj.create_by}%`);
    }

    if (obj.status) {
        sql += ` AND status = ?`;
        countSql += ` AND status = ?`;
        conditions.push(obj.status);
    }

    if (obj.node_type) {
        sql += ` AND node_type = ?`;
        countSql += ` AND node_type = ?`;
        conditions.push(obj.node_type);
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
}
