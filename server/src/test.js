const express = require("express"); //llamar al express
const app = express();
const userRoutes = require('./routes/users')

const port = process.env.PORT || 3000;

const requestListener = function (req, res) {
  res.end("Your IP Addresss is: " + req.socket.localAddress);
};

app.use(express.json());
app.use('/user', userRoutes);

app.listen(port, '0.0.0.0', () => {
  console.log('Listening to port: ' + port);
});