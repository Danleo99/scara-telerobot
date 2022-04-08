var path = require('path');
var myIP = require("ip");
const cors = require("cors");
// Modules
const express = require("express"); //llamar al express
const app = express();
const server = require('http').Server(app);
const io = require('socket.io')(server);
//My routes
const userRoutes = require('./routes/users')
const routinesRouter = require('./routes/routines')


const port = process.env.PORT || 80;

app.use(express.json());
app.use(cors());
app.use(express.static(path.join(__dirname, '../public_html')));
app.use('/user', userRoutes);
app.use('/routines', routinesRouter);

io.on('connection', (client) => {
  console.log('Connected to:', client.id);

  client.on('disconnect', () => {
    console.log('Has disconnected: ' + client.id);
  });
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Listening on http://${myIP.address()}:${port}`);
});