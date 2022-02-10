const express = require('express')
const database = require('../../db/dbconnect')
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs')
const router = new express.Router()

const tokenKey = 'Secure@telerobot2022'

router.post('/signup', (req, res) => {
    const { email, password } = req.body
    const query1 = 'SELECT * FROM users WHERE email LIKE ? LIMIT 1'
    database.query(query1, [email],
        (e, rows, fields) => {
            if (rows.length == 0) {
                const token = jwt.sign({ password }, tokenKey)
                const salt = bcrypt.genSaltSync(8);
                const hashPassword = bcrypt.hashSync(password, salt);

                const query2 = 'INSERT INTO users(email, password, token) VALUES (?, ?, ?)'
                database.query(query2, [email, hashPassword, token],
                    (err, rows, fields) => {
                        if (!err) {
                            res.status(200).send()
                        } else {
                            res.status(400).send(err)
                        }
                    });
            } else {
                res.status(400).send('Este correo ya esta registrado')
            };
        });
});

router.post('/login', (req, res) => {
    const { email, password } = req.body
    const query = 'SELECT * FROM users WHERE email LIKE ? AND password LIKE ?';
    database.query(query, [email, password], (e, rows, fields) => {
        if (!e) {
            res.json(rows[0]);
        } else {
            console.log(e);
        }
    });
});

module.exports = router;