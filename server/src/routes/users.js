const express = require('express');
const database = require('../../db/dbconnect');
const { auth, secureUser } = require('../middleware/auth');
const bcrypt = require('bcryptjs');
const router = new express.Router()

// Fast Authentication 
router.get('/', auth, (req, res) => {
    res.status(202).send(req.user)
})

// Create a user
router.post('/signup', async (req, res) => {
    const { email, password } = req.body
    const query1 = 'SELECT * FROM users WHERE email LIKE ? LIMIT 1'
    const query2 = 'INSERT INTO users(email, password, token) VALUES (?, ?, ?)'
    try {
        // Check if the email is already registered in the DB
        const [rows, fields] = await database.query(query1, [email]);
        if (rows.length == 0) {
            // If not registed take the password hash it, and save it into de DB
            const [token, hashPassword] = await secureUser(email, password);
            await database.query(query2, [email, hashPassword, token]);
            res.status(201).send(token);
        } else {
            res.status(409).send('Este correo ya esta registrado')
        };
    } catch (error) {
        res.status(400).send(error)
    }
});

// Log in an existing User
router.get('/login', async (req, res) => {
    const { email, password } = req.body
    const query = 'SELECT * FROM users WHERE email LIKE ?';
    try {
        const [rows, fields] = await database.query(query, [email]);
        if (rows.length != 0) {
            const approved = await bcrypt.compare(password, rows[0].password)
            if (approved) {
                res.status(202).send(rows[0])
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

// Update user
router.patch('/update', auth, async (req, res) => {
    const updates = Object.keys(req.body) // Keys of the updates
    const allowedUpdates = ['Nombre', 'Apellido', 'password'] // Accepted Updates
    const isValid = updates.every((update) => allowedUpdates.includes(update)) // Check if the updates are valid
    const query = 'UPDATE users SET Nombre = ?, Apellido = ?, password = ? WHERE id = ?';

    if (!isValid) {
        return res.status(400).send({ error: 'Invalid Updates' })
    }
    try {
        const user = req.user // Updates de user
        updates.forEach(async (update) => {
            if (update == 'password') {
                const [token, hashPassword] = await secureUser(req.body.email, req.body.password);
                user[update] = hashPassword
            } else {
                user[update] = req.body[update]
            }
        });
        await database.query(query, [user.Nombre, user.Apellido, user.password, user.id]);
        res.status(200).send(user)
    } catch (error) {
        res.status(400).send(error)
    }
});

//Delete User
router.delete('/fullydelete', auth, async (req, res) => {
    const approved = req.body
    const query = 'DELETE FROM users WHERE id = ?';
    try {
        if (approved) {
            const [rows, fields] = await database.query(query, [req.user.id])
            res.status(200).send('Usuario Eliminado')
        } else {
            res.status(400).send('No se puede eliminar')
        }
    } catch (error) {
        res.status(400).send(error)
    }
})

module.exports = router;