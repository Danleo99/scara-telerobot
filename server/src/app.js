const fs = require("fs");
const https = require("https");
const path = require("path");
const express = require("express"); //llamar al express
const app = express();

const PORT = 3000;

const keys = path.join(__dirname, "../certificates")

app.get("/", (req, res) => {
  res.status(200);
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

app.get("/contact", (req, res) => {
  res.status(200);
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

app.get("/login", (req, res) => {
  res.status(200);
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

https.createServer({
  key: fs.readFileSync(
    `${keys}/PrivKey.key`
  ),
  cert: fs.readFileSync(
    `${keys}/PubKey.pem`
  )
}, app)
  .listen(PORT, () => {
    console.log("My HTTPS server listening on port " + PORT);
  });
