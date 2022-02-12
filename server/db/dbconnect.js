const mysql = require('mysql2')

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Tesis2022!',
    database: 'telerobot'
});

pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.log('Connection to MySQL lost');
        } else if (err.code === 'ER_CON_COUNT_ERROR') {
            console.log('Database has to many connections');
        } else if (err.code === 'ECONNREFUSED') {
            console.log('Database connection refused');
        } else {
            console.log(err);
            return;
        }
    } else {
        connection.release();
        console.log('Database connected');
    }
});

const promisePool = pool.promise();

module.exports = promisePool;