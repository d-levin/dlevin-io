// Database dependency
var mysql = require('mysql');

module.exports = {
    var config = {
        mysql_pool: mysql.createPool({
            connectionLimit: 10,
            host: 'localhost',
            port: '8889',
            user: 'root',
            password: 'root',
            database: 'mydb'
        })
    }
};
