const fs = require("fs");
const https = require("https");
const path = require("path");
const express = require("express"); //llamar al express
const app = express();

const PORT = 443;

const keys  =  path.join(__dirname,"../certificates")
const public = path.join(__dirname, "../public");
const views = path.join(__dirname, "../templates/views");
const partials = path.join(__dirname, "../templates/partials");

// SetUp directory to serve
app.use(express.static(public));

app.get("/", (req, res) => {
  res.status(200);
  res.sendFile("index.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

app.get("/contact", (req, res) => {
  res.status(200);
  res.sendFile("contactus.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

app.get("/login", (req, res) => {
  res.status(200);
  res.sendFile("login.html", { root: public });
  flag_log = 0; // para que al darle salir no vuelva a entrar
});

https.createServer({
      key: fs.readFileSync(
        `${keys}/PrivKey.key`
      ),
      cert: fs.readFileSync(
        `${keys}/PubKey.pem`
      )},app)
  .listen(PORT, () => {
    console.log("My HTTPS server listening on port " + PORT + "...");
  });
