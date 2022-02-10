# MySQL API que sirve a la app

## Database
Programacion SQL para base de datos, esta se ve aplicada en db/tables.sql :

Estructurar base de datos:
Tener muy en cuenta los tipos de datos de las columnas, ver [datos de sql](https://www.mysqltutorial.org/mysql-data-types.aspx) para crear las tablas.
```
create database <name> -> crea base de datos
drop database <name> -> elimina base de datos
create table <name> (colums) -> crea tabla de datos
alter table <table> -> cambiar configuracion de la tabla, agregar columnas, etc..
drop table <name> -> elimina tabla de datos
```

Consulta y cambios en la base de datos:
```
select <> from <table> -> busca dentro de la tabla
insert <table> -> agrega a la tabla
update <> from <table> -> actualiza parametros en la tabla
delete <> -> elimina de la tabla
```

Funciones en SQL: 
```
count(*) -> Cuenta las filas de la busqueda
max(datos) -> Devuelve el maximo datos
min(datos) -> Devuelve el minimo datos
avg(datos) -> Devuelve el promedio de datos
sum(datos) -> Devuelve la suma de datos
```

Busqueda con claves o joints:

Para realizar busquedas que cuenten con claves foraneas o relaciones se hace uso de las busqueda con joints, los tipos de joint se pueden ver en [explicacion sql joints.](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/SQL_Joins.svg/1280px-SQL_Joins.svg.png)
