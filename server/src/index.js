const path = require("path");
const express = require("express"); //llamar al express
const app = express();

const public = path.join(__dirname, "../public");

// SetUp directory to serve
app.use(express.static(public));

app.get("/", function (req, res) {
  res.status(200);
  res.sendFile("index.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});
app.get("/contact", function (req, res) {
  res.status(200);
  res.sendFile("contactus.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});
app.get("/login", function (req, res) {
  res.status(200);
  res.sendFile("login.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

app.listen(3000, '0.0.0.0', function() {
  console.log('Listening to port:  ' + 3000);
});