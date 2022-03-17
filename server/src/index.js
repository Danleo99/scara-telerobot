const express = require("express"); //llamar al express
const app = express();
const userRoutes = require('./routes/users')
const routinesRouter = require('./routes/routines')
const cors = require("cors");
var path = require('path');

const port = process.env.PORT || 80;

app.use(express.json());
app.use(cors());
app.use(express.static(path.join(__dirname, '../public_html')));
app.use('/user', userRoutes);
app.use('/routines', routinesRouter);

app.listen(port, '0.0.0.0', () => {
  console.log('Listening to port: ' + port);
});