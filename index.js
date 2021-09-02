console.log("Servidor Prueba");
const { response } = require("express");
//objeto express JS
const express = require("express"); //llamar al express
const app = express();

app.use(express.json());
app.use(express.static("public"));

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "Santi", //el usuario que hay en el setup de mysql 
    password: "1234",
    database: "pruebaabb"
});


var flag_log = 0;  // flag 0 no entra a test, 1 si
var vernombre = {
    user: "",
    pass: ""
};

/////////////////////////////////////////////////////////////////////////////
//pagina inicial
app.get("/", function (request, response) {

    response.status(200);
    // response.send("Hola mundo");
    //ya le vamos a enviar el html
    response.sendFile(__dirname + "/public/index.html");
    flag_log = 0;  // para que al darle salir no vuelva a entrar

});
///////////////////////////////////////////////////////////////////
/////////// Recepcion vector Json

app.post("/vector", function (request, response) {

    let data = request.body;
    console.log(data);
    response.status(200);


    con.query('INSERT INTO sensores (`ID_Sensor`,`Potencia`, `Temp`, `Tiempo`,`TasaFail`) VALUES (?,?,?,?,?)', [data.id, data.Potencia, data.Temp, data.Tiempo, data.TasaFail], function (error, result, fields) {

        var data = JSON.parse(JSON.stringify(result));
        response.status(200);
        response.send("OK");

    });

});

/////////////////////////////////////////////////////////////////////////////
//me lleva al tablero de control
app.get("/test", function (request, response) {

    if (flag_log === 1) {  //para no saltarme el usuario y contraseña

        response.status(200);
        // response.send("Hola mundo");
        //ya le vamos a enviar el html
        response.sendFile(__dirname + "/test.html");
    } else {
        response.status(404);
        response.send("Error");
    }
});

/////////////////////////////////////////////////////////////////////////////
//me lleva al menu registro 
/*
app.get("/registro", function(request,response){

 
        response.status(200);
        console.log("oprimio registro");
       response.sendFile(__dirname + "/public/registro.html");

}); 
*/
/////////////////////////////////////////////////////////////////////////////

app.post("/test1", function (request, response) {

    let data = request.body;
    console.log(data.device_id);
    response.status(200);
    response.send("OK");

});

/////////////////////////////////////////////////////////////////////////////
//me busca si estoy inscrito en base de datos
app.post("/login", function (request, response) {

    let data = request.body; //estamos sacando la informacion dentro del body, ese vector datau y la estamos guardando en data
    //data = {}; //Se define como un objeto 
    console.log(data);
    response.status(200);

    response.status(200);

    (data[0].id != 0)
    response.send("OK");
    console.log("Ok");
    flag_log = 1;

    // if (data.user && data.pass) {
    //     con.query('SELECT * FROM usuarios WHERE Usuario = ? AND Pass = ?', [data.user, data.pass], function (error, result, fields) {  //el where usuario and password es para ver que si haya coincidencia

    //         //me responde en la variable result
    //         //tabla en mysql usuarios
    //         //columna dentro de tabla usuario

    //         var data = JSON.parse(JSON.stringify(result));
    //         //var data = result; //bota todo el vector
    //         console.log('Resultado base de datos: ');
    //         //console.log(data);

    //         if (data[0]) {  //si existe la posicion de ese vector hagame algo, ya que estoy buscando una posicion especifica

    //             // console.log(data[0].id);  //se imprime el id
    //             response.status(200);

    //             (data[0].id != 0)
    //             response.send("OK");
    //             console.log("Ok");
    //             flag_log = 1;

    //         } else {
    //             response.send('No user');
    //             console.log('No user');
    //             flag_log = 0;

    //         }

    //         // response.status(200);
    //         // el * es para seleccionar todo, puedo darle select id, buscar coincidencias del usuario y password, hay alguno que corresponda a ese usuario con esta contraseña
    //     });
    // }
});


////para guardar el nombre de usuario y mostrarlo luego en la pagina test

app.post("/verid", function (request, response) {

    let data = request.body; //estamos sacando la informacion dentro del body, ese vector datau y la estamos guardando en data
    //data = {}; //Se define como un objeto 
    vernombre = data;  // guardo la vvariable data que viene de un datau y la guardo para usarla en /mostrarid
    console.log("entro aca");
    console.log(vernombre);
    response.status(200);

});

////para mostrar el nombre de usuario en el control
app.post("/mostarid", function (request, response) {

    console.log("tambien aca");
    response.send(vernombre);      //  variable del nombre del usuario

    console.log(vernombre);
    response.status(200);

});


/////////////////////////////////////////////////////////////////////////////

//Para fecha 1 sensor 1
app.post("/datos1", function (request, response) {

    let data = request.body; //estamos sacando la informacion dentro del body, ese vector datau y la estamos guardando en data
    //data = {}; //Se define como un objeto 
    console.log(data);
    response.status(200);
    //ordeno la base de datos en descendente para siempre tener el ultimo registro
    con.query("SELECT * FROM posicion ORDER BY ID DESC", function (error, result, fields) {  //el where usuario and password es para ver que si haya coincidencia

        var data = JSON.parse(JSON.stringify(result));
        //var data = result; //bota todo el vector
        console.log('Resultado base de datos: ');
        console.log(data);

        if (data[0]) {  //si existe la posicion de ese vector hagame algo, ya que estoy buscando una posicion especifica

            // console.log(data[0].id) ;  // console.log(data[0].id);  //se imprime el id
            response.status(200);
            response.send(data[0]);
            console.log("Ok");

        } else {
            response.send('Sensor no encontrado');
            console.log('Sensor no encontrado');
        }
    });
});

//Para fecha 2 sensor 1
app.post("/datos2", function (request, response) {

    let data = request.body; //estamos sacando la informacion dentro del body, ese vector datau y la estamos guardando en data
    //data = {}; //Se define como un objeto 
    console.log(data);
    response.status(200);

    con.query("SELECT * FROM posicion ORDER BY ID DESC", function (error, result, fields) {  //el where usuario and password es para ver que si haya coincidencia

        var data = JSON.parse(JSON.stringify(result));
        //var data = result; //bota todo el vector
        console.log('Resultado base de datos: ');
        console.log(data);

        if (data[0]) {  //si existe la posicion de ese vector hagame algo, ya que estoy buscando una posicion especifica

            // console.log(data[0].id) ;  // console.log(data[0].id);  //se imprime el id
            response.status(200);
            response.send(data[1]);
            console.log("Ok");

        } else {
            response.send('Sensor no encontrado');
            console.log('Sensor no encontrado');
        }
    });
});


//Para fecha 3 sensor 1
app.post("/datos3", function (request, response) {

    let data = request.body; //estamos sacando la informacion dentro del body, ese vector datau y la estamos guardando en data
    //data = {}; //Se define como un objeto 
    console.log(data);
    response.status(200);

    con.query("SELECT * FROM posicion ORDER BY ID DESC", function (error, result, fields) {  //el where usuario and password es para ver que si haya coincidencia

        var data = JSON.parse(JSON.stringify(result));
        //var data = result; //bota todo el vector
        console.log('Resultado base de datos: ');
        console.log(data);

        if (data[0]) {  //si existe la posicion de ese vector hagame algo, ya que estoy buscando una posicion especifica

            // console.log(data[0].id) ;  // console.log(data[0].id);  //se imprime el id
            response.status(200);
            response.send(data[2]);
            console.log("Ok");

        } else {
            response.send('Sensor no encontrado');
            console.log('Sensor no encontrado');
        }
    });
});





//Final del codigo
app.listen(3000, function () {

    console.log("Servidor Iniciado");

});



