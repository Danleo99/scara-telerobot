var pregunta1 = "0";
var pregunta2 = "0";
var pregunta3 = "0";

function respuesta1 (valor){
    pregunta1 = valor;
}

function respuesta2 (valor){
    pregunta2 = valor;
}

function respuesta3 (valor){
    pregunta3 = valor;
}

var datau = {
    p1: "",
    p2: "",
    p3: ""
};



//Fecha 1 sensor 1
document.getElementById('bact1').addEventListener('click', function() {
    console.log("oprimio boton");
$.post({
    url: "/datos1",

    success: function(datosEntrada,status) {
        //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
        document.getElementById('sx1').innerHTML = datosEntrada.x;  
        document.getElementById('sy1').innerHTML = datosEntrada.y;
        document.getElementById('sz1').innerHTML = datosEntrada.z;
    }
});
});


//Fecha 2 sensor 1
document.getElementById('bact2').addEventListener('click', function() {
    console.log("oprimio boton");
$.post({
    url: "/datos2",

    success: function(datosEntrada,status) {
        //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
        document.getElementById('sx2').innerHTML = datosEntrada.x;  
        document.getElementById('sy2').innerHTML = datosEntrada.y;
        document.getElementById('sz2').innerHTML = datosEntrada.z;
    }
});
});

//Fecha 3 sensor 1
document.getElementById('bact3').addEventListener('click', function() {
    console.log("oprimio boton");
$.post({
    url: "/datos3",

    success: function(datosEntrada,status) {
        //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
        document.getElementById('sx3').innerHTML = datosEntrada.x;  
        document.getElementById('sy3').innerHTML = datosEntrada.y;
        document.getElementById('sz3').innerHTML = datosEntrada.z;
    }
});
});



//actualizar todos     ------------------------------------------------------------------------------------------
document.getElementById('bactt').addEventListener('click', function() {

    $.post({
        url: "/datos1",
    
        success: function(datosEntrada,status) {
            //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
            document.getElementById('sx1').innerHTML = datosEntrada.x;  
            document.getElementById('sy1').innerHTML = datosEntrada.y;
            document.getElementById('sz1').innerHTML = datosEntrada.z;
        }
    });

    $.post({
        url: "/datos2",
    
        success: function(datosEntrada,status) {
            //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
            document.getElementById('sx2').innerHTML = datosEntrada.x;  
            document.getElementById('sy2').innerHTML = datosEntrada.y;
            document.getElementById('sz2').innerHTML = datosEntrada.z;
        }
    });

    $.post({
        url: "/datos3",
    
        success: function(datosEntrada,status) {
            //alert(datosEntrada.temp);   //para reemplazar un dato en la pagina de los que tengo en server
            document.getElementById('sx3').innerHTML = datosEntrada.x;  
            document.getElementById('sy3').innerHTML = datosEntrada.y;
            document.getElementById('sz3').innerHTML = datosEntrada.z;
        }
    });

    

});



//----------------------------------------------------------------------------------------
//mostrar datos en pagina
document.getElementById('bactn').addEventListener('mousemove', function() { //comentado para que inicie automaticamente
   // console.log("oprimio boton actualizar");
    
    $.post({

        url: "/mostarid",
        data: JSON.stringify(datau),
        contentType: "application/json",
        success: function(datosEntrada,status) {

        document.getElementById('pnom').innerHTML = datosEntrada.user;  //para reemplazar un dato en la pagina de los que tengo en server
       // document.getElementById('p4h').innerHTML = datosEntrada.hum;    
        response.status(200);
                            
          }
        
    });

});

//mostrar datos en pagina  intento con otro listener
document.getElementById('bactn').addEventListener('open', function() { //comentado para que inicie automaticamente
    // console.log("oprimio boton actualizar");
     
     $.post({
 
         url: "/mostarid",
         data: JSON.stringify(datau),
         contentType: "application/json",
         success: function(datosEntrada,status) {
 
         document.getElementById('pnom').innerHTML = datosEntrada.user;  //para reemplazar un dato en la pagina de los que tengo en server
        // document.getElementById('p4h').innerHTML = datosEntrada.hum;    
         response.status(200);
                             
           }
         
     });
 
 });




document.getElementById('b4').addEventListener('click', function() {
    window.location.replace('/')  //me lleva al home
});

