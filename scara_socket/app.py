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
video_getter = camara.VideoGet()
            
sio = socketio.AsyncServer(async_mode='asgi')
app = socketio.ASGIApp(sio, static_files={
    '/': './public/'
})

@sio.event
async def connect(sid, environ):
    print(f'New connection, ID: ${sid}')

@sio.event
async def home(sid, data):
    scara.home()
    return 'Starting the robot in Home Position'

@sio.event
async def reset(sid, data):
    scara.configurar_hombro()
    time.sleep(2)
    scara.configurar_codo()

@sio.event
async def disconnect(sid):
    print(f'Finish connection with ID: ${sid}')

@sio.event
async def startVideo(sid, data):
    global activateVideo
    global video_getter
    activateVideo = not activateVideo
    while activateVideo:
        print('frame')
        cv.imshow('frame',video_getter.frame)

if __name__ == "__main__":
    scara.abrir_puerto('COM6')
    hiloLeer = threading.Thread(target = scara.leer, daemon = True).start()
    # hiloCamara = video_getter.start()
    print('Starting Server ...')
    uvicorn.run('app:app', host = HOST, port = PORT)
    
# video_getter.stop() 