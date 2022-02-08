const express = require('express')
const database = require('../db/database')
const router = new express.Router()

router.get('/allusers', (req, res) => {
    database.query('select * from users', (e, rows, fields) => {
        if (!e) {
            res.json(rows)
        } else {
            console.log(e)
        }
    });
});

router.get('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'select * from users where id = ?';
    database.query(query, [id], (e, rows, fields) => {
        if (!e) {
            res.json(rows[0]);
        } else {
            console.log(e);
        }
    });
});

module.exports = router;