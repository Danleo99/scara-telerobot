const express = require('express');
const database = require('../../db/dbconnect');
const { secureUser } = require('../../middleware/auth');
const bcrypt = require('bcryptjs');
const router = new express.Router()

router.post('/signup', async (req, res) => {
    const { email, password } = req.body
    const query1 = 'SELECT * FROM users WHERE email LIKE ? LIMIT 1'
    const query2 = 'INSERT INTO users(email, password, token) VALUES (?, ?, ?)'
    try {
        const [rows, fields] = await database.query(query1, [email]);
        if (rows.length == 0) {
            const [token, hashPassword] = await secureUser(password);
            const [rows, fields] = await database.query(query2, [email, hashPassword, token]);
            res.status(201).send(token);
        } else {
            res.status(409).send('Este correo ya esta registrado')
        };
    } catch (error) {
        res.status(400).send(error)
    }
});

router.post('/login', async (req, res) => {
    const { email, password } = req.body
    const query = 'SELECT * FROM users WHERE email LIKE ?';
    try {
        const [rows, fields] = await database.query(query, [email]);
        if (rows.length != 0) {
            const approved = await bcrypt.compare(password, rows[0].password)
            if (approved) {
                res.status(202).send(rows[0].token)
            } else {
                res.status(401).send()
            }

        } else {
            res.status(406).send('El usuario no esta registrado')
        }
    } catch (error) {
        res.status(400).send(error)
    }
});

module.exports = router;