var path = require('path');
var myIP = require("ip");
const cors = require("cors");
// Modules
const express = require("express"); //llamar al express
const app = express();
const server = require('http').createServer(app);
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

io.on('connection', (socket) => {
  console.log('Connected to:', socket.id);

  socket.on('home', ()=>{
    socket.broadcast.emit('home', 'run')
  })

  socket.on('reset', ()=>{
    socket.broadcast.emit('reset', 'run')
  })

  socket.on('disconnect', () => {
    console.log('Has disconnected: ' + socket.id);
  });

  socket.on('degreeChange',(change)=>{
    socket.broadcast.emit('moveAbs', change)
    socket.broadcast.emit('sliderChange1', change)
  })

  socket.on('changeTCI',(change)=>{
    socket.broadcast.emit('moveXY', change)
    socket.broadcast.emit('sliderChange2', change)
  })

  socket.on('startVideo', (session)=>{
    socket.broadcast.emit('startVideo', session)
  })

  socket.on('candidate', (data)=>{
    socket.broadcast.emit('candidate', data)
  })

  socket.on('gcode', (data)=>{
    socket.broadcast.emit('gcode', data)
  })

  socket.on('runRutine', (data)=>{
    routine = data['routine']
    routine.forEach((element,index) => {
      routine[index] = 'scara.mover_xy'+element
    });
    routine.push('scara.mover_xy(0,450)')
    data['routine'] = routine
    socket.broadcast.emit('routine', data)
  })
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Listening on http://${myIP.address()}:${port}`);
});