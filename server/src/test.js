const express = require("express"); //llamar al express
const app = express();

const port = process.env.PORT || 8000;

app.use(express.json());

app.get("/", function (req, res) {
  res.send('<h1>Hola Mundo<h1>')
  res.status(200);
});
app.get("/contact", function (req, res) {
  res.status(200);
  flag_log = 0; // para que al darle salir no vuelva a entrar
});
app.get("/login", function (req, res) {
  const data = req.body
  try {
    res.status(200)
  } catch (error) {
    console.log(data)
    res.status(400)
  }
});

app.listen(port, '0.0.0.0', function () {
  console.log('Listening to port:  ' + port);
});