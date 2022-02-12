const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const database = require('../../db/dbconnect');

const tokenKey = 'Secure@telerobot2022'

// Use the token to give access to the app
const auth = async (req, res, next) => {
    const query = 'SELECT * FROM users WHERE (email = ? AND token = ?)';
    try {
        const token = req.header('accessToken')
        const decoded = jwt.verify(token, tokenKey)
        const [rows, fields] = await database.query(query, [decoded.email, token])
        if (rows.length == 0) {
            throw new Error()
        } else {
            req.user = rows[0]
            next()
        }
    } catch (error) {
        res.status(401).send({ error: 'Please Authenticate' })
    }
};

// Secure the user using hashing password and generate a token
const secureUser = async (email, password) => {
    const token = jwt.sign({ email }, tokenKey)
    const hashPassword = await bcrypt.hash(password, 8)

    return [token, hashPassword]
}

exports.auth = auth;
exports.secureUser = secureUser;