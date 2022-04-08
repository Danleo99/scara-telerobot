from pip import main
import socketio
import cv2 as cv
import threading, socket, time
import uvicorn
## My Files
import scara
import camara

PORT = 3000
HOST = socket.gethostbyname(socket.gethostname())

activateVideo = False
frameSend = None
# video_getter = camara.VideoGet()
            
sio = socketio.Client()

@sio.event
def connect():
    print(f'New connection to server')

@sio.event
def connect_error(data):
    print("The connection failed!")

@sio.event
async def home(sid, data):
    print('Homming')
    scara.reset_codo()
    time.sleep(2)
    scara.reset_hombro()
    time.sleep(2)
    scara.configurar_hombro()
    time.sleep(2)
    scara.configurar_codo()
    time.sleep(2)
    scara.home()
    return 'Starting the robot in Home Position'

@sio.event
async def reset(sid, data):
    print("Reset robot")
    scara.reset_codo()
    time.sleep(2)
    scara.reset_hombro()
    time.sleep(2)
    scara.configurar_hombro()
    time.sleep(2)
    scara.configurar_codo()

@sio.event
def disconnect():
    print(f'Finish connection')

@sio.event
def startVideo(sid, data):
    global activateVideo
    global video_getter
    activateVideo = not activateVideo
    while activateVideo:
        print('frame')
        cv.imshow('frame',video_getter.frame)

    
if __name__ == "__main__":
    try:
        #scara.abrir_puerto('COM6')
        hiloLeer = threading.Thread(target = scara.leer, daemon = True).start()
        sio.connect('http://192.168.0.10:80')
    except KeyboardInterrupt:
        print('Closing connection with Server')
        sio.disconnect()    