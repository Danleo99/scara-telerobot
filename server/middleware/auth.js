const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const database = require('../db/dbconnect')

const tokenKey = 'Secure@telerobot2022'

const auth = async (req, res, next) => {
    try {
        // const token = req.header('Authorization').replace('Bearer ', '')
        // const decoded = jwt.verify(token, 'thisisthecertificate')
    } catch (error) {

    }
};

const secureUser = async (password) => {
    const token = jwt.sign({ password }, tokenKey)
    const hashPassword = await bcrypt.hash(password, 8)

    return [token, hashPassword]
}

exports.auth = auth;
exports.secureUser = secureUser;