const mysql = require('mysql2')

const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Tesis2022!',
    database: 'telerobot'
});

connection.getConnection((e) => {
    if (e) {
        console.log(e);
        return;
    } else {
        console.log('Database connected')
    }
});

module.exports = connection;