const express = require("express"); //llamar al express
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server);
const cors = require("cors");
const spawn = require('child_process').spawn;

const port = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());

io.on('connection', (client) => {
  console.log('Connected to: ', client.id);
  client.send('Hello from server ');

  client.on('/test', (msg) => { console.log(msg) });

  client.on('/python', (action) => {
    const pythonProcess = spawn('python', ['./controlRobot.py', action])
    pythonProcess.stdout.on('data', function (data) {
      console.log(data.toString())
    })
    pythonProcess.stderr.on('data', data => console.log(data.toString()))
  });

});

server.listen(port, '0.0.0.0', () => {
  console.log('Listening to port: ' + port);
});
