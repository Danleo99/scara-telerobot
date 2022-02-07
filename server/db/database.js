const mysql = require('mysql2')

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Tesis2022!',
    database: 'telerobot'
});

connection.connect(function (e) {
    if (e) {
        console.log(e);
        return;
    } else {
        console.log('Database connected')
    }
});

module.exports = connection;