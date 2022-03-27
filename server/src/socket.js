const path = require('path')
const express = require("express"); //llamar al express
const app = express();
const server = require('http').Server(app);
const io = require('socket.io')(server);
const cors = require("cors");
const spawn = require('child_process').spawn;
const cv2 = require('opencv4nodejs-prebuilt');

const port = process.env.PORT || 5000;

const video = new cv2.VideoCapture(0);
video.set(cv2.CAP_PROP_FRAME_WIDTH, 500);
video.set(cv2.CAP_PROP_FRAME_HEIGHT, 500);
video.set(cv2.CAP_PROP_BUFFERSIZE, 0);
const fps = 60;
var sendVideo = false

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'))
})

io.on('connection', (client) => {
  console.log('Connected to: ', client.id);

  setInterval(() => {
    const frame = video.read();
    const image = cv2.imencode('.jpg', frame).toString('base64');
    client.broadcast.emit('video', image);
  }, 1000 / fps);

  client.on('startVideo', () => {
    console.log('Video Starting....')
    sendVideo = true
  })

  client.on('python', (action) => {
    const pythonProcess = spawn('python', ['./termSCARAv1.py', action])
    pythonProcess.stdout.on('data', function (data) {
      console.log(data.toString())
    })
    pythonProcess.stderr.on('data', data => console.log(data.toString()))
  });

  client.on('disconnect', () => {
    //video.release()
    //cv2.destroyAllWindows()
    console.log('Has disconnected from the chat: ' + client.id);
  });

});

server.listen(port, '0.0.0.0', () => {
  console.log('Listening to port: ' + port);
});
