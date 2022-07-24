# :satellite: TELEROBOT :mechanical_arm:
This is our repository to present the work and multiple experiments related to the thesis.
The thesis is based on programming a web server and web application to let the people interact and program the SCARA robot found at the EIA Unisersity, Colombia.

## Project Structure 
| **FOLDER**   | **EXPLICATION**                                                                                                                                                                             |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| scara_socket | Full duplex communication implementation using socket io in Python, this client will be place  next to the robot to comunicate using USB and the Python script created from a past thesis.  |
| server       | Server implementation to deploy in an instace of EC2 at AWS for the comunication and signaling  of all the platforms with a MySQL database                                                  |
| telerobot    | Flutter project used to generate the HTML, .exe and .apk programs, this helps to give access to more users to the app.                                                                                                                        |

## SOFTWARE DEPENDENCIES :books:
- **NodeJS:**<br>
This runtime is use into AWS for running the services provided to the users.
- **Express:**<br>
Framework used to develop an API for connection between user-server-database.
- **SocketIO:**<br>
Service used for fast communication between user-robot for fast programming and testing.
- **MySQL:**<br>
Database used to save user, robot and routines information for fast deployment.
- **Flutter:**<br>
Framework used to design the Front-End of the web app and export mobile verions to IOS and Android.
