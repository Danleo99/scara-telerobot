const express = require('express');
const database = require('../../db/dbconnect');
const { auth } = require('../middleware/auth');
const router = new express.Router();

// get all the routines
router.get('/', auth, async (req, res) => {
    const query = 'SELECT * FROM routines WHERE user_id = ?';
    try {
        const [rows, fields] = await database.query(query, [req.user.id])
        res.send(rows)
    } catch (error) {
        res.status(400).send(error)
    }
});

// create a new routine
router.post('/new', auth, async (req, res) => {
    const { robot_id, start, end, route, tool, description } = req.body;
    const query = `INSERT INTO routines(user_id, robot_id, start, end, route, tool, description) VALUES 
        (${req.user.id},${robot_id},POINT${start},POINT${end},${route},${tool},'${description}')`
    try {
        const [rows, fields] = await database.query(query);
        res.status(201).send(rows)
    } catch (error) {
        res.status(400).send(error)
    }
});

// Update a routine
router.patch('/update', auth, async (req, res) => {
    const updates = Object.keys(req.body) // Keys of the updates
    const { id, start, end, route, tool, description } = req.body;
    const allowedUpdates = ['start', 'end', 'route', 'tool', 'description'] // Accepted Updates
    const isValid = updates.every((update) => allowedUpdates.includes(update)) // Check if the updates are valid
    const query = `UPDATE routines SET start = POINT${start}, end = ${end}, route = ${route},
        tool = ${tool}, description = '${description}' WHERE id = ${id} `; // multipoint(point(1,1), point(1,2))

    if (!isValid) {
        return res.status(400).send({ error: 'Invalid Updates' })
    }
    try {
        const [rows, fields] = await database.query(query);
        res.status(200).send(rows)
    } catch (error) {
        res.status(400).send(error)
    }
})

// Delete a routine
router.delete('/delete', auth, async (req, res) => {
    const { id } = req.body
    const query = 'DELETE FROM routines WHERE id = ? AND user_id = ?';
    try {
        const [rows, fields] = await database.query(query, [id, req.user.id]);
        res.status(200).send(rows);
    } catch (error) {
        res.status(400).send(error);
    }
});

module.exports = router;