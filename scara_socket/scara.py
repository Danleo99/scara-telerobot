import time, math
import serial
import numpy as np

puerto = serial.Serial()
puerto.baudrate = 19200
leido = ''
aux = 0
theta_h = 0
theta_c = 0
mover_h = 0
mover_c = 0
cq = 0
hq = 0

# Open the port for communication
def abrir_puerto(COM):#listo
    puerto.port = COM
    puerto.open()
    return f'Puerto ${COM} abierto'

# Send to the PIC a bit
def enviar_byte(d):#listo
    try:
        puerto.write(str(d).encode())
    except:
        print("insert", "El puerto serial no está abierto")    

# Read the data from the port, we use this in a separate thread to know how is the robot at every moment
def leer():
    while True:
        global puerto
        global leido
        if puerto.is_open:
            try:
                leido = puerto.read().decode()
            except:
                break

# Set the first degree of freedom as ready to work
def configurar_hombro():#listo_trama
    enviar_byte('C')
    enviar_byte('1')
    enviar_byte('F')

# Set the second degree of freedom as ready to work
def configurar_codo():#listo_trama
    enviar_byte('C')
    enviar_byte('2')
    enviar_byte('F')

# Reset the fisrt degree of freedom from a block position
def reset_hombro():#listo_trama
    enviar_byte('R')
    enviar_byte('1')
    enviar_byte('F')

# Reset the second degree of freedom from a block position
def reset_codo():#listo_trama
    enviar_byte('R')
    enviar_byte('2')
    enviar_byte('F')

#Sets the max speed of the first degree of freedom
def vel_max_hombro(usr):#listo_trama
    cadena = ''
    long = len(str(usr))-1
    cadena = 'V1'+str(long)+str(usr)+'F'
    for i in range(0,len(cadena)):
        enviar_byte(cadena[i])

#Sets the max acceleration of the first degree of freedom
def acc_max_hombro(usr):#listo_trama
    cadena = ''
    long = len(str(usr))-1
    cadena = 'A1'+str(long)+str(usr)+'F'
    for i in range(0,len(cadena)):
        enviar_byte(cadena[i])

#Sets the max speed of the second degree of freedom
def vel_max_codo(usr):#listo_trama
    cadena = ''
    long = len(str(usr))-1
    cadena = 'V2'+str(long)+str(usr)+'F'
    for i in range(0,len(cadena)):
        enviar_byte(cadena[i])

#Sets the max acceleration of the second degree of freedom
def acc_max_codo(usr):#listo_trama
    cadena = ''
    long = len(str(usr))-1
    cadena = 'A2'+str(long)+str(usr)+'F'
    for i in range(0,len(cadena)):
        enviar_byte(cadena[i])

# Robot finds the home position
def home():#listo
    global theta_h
    global theta_c
    global leido
    global aux
    vel_max_codo(100)
    time.sleep(0.015)
    acc_max_codo(5000)
    time.sleep(0.015)
    vel_max_hombro(100)
    time.sleep(0.015)
    acc_max_hombro(5000)
    time.sleep(0.015)
    theta_c = 0
    theta_h = 0
    aux = 1
    rotar_codo(300)
    while leido != '2':
        pass
    time.sleep(0.5)
    reset_codo()
    time.sleep(0.5)
    configurar_codo()
    time.sleep(2)
    rotar_hombro(-220)
    while leido != '1':
        pass
    time.sleep(0.5)
    reset_hombro()
    time.sleep(0.5)
    configurar_hombro()
    time.sleep(2)
    rotar_codo(-122)
    time.sleep(2)
    rotar_hombro(92)
    time.sleep(2)
    leido = ''

# Function to detect if the robot needs position up or down the specifyc point
def mover_xy(x,y):#listo
    if(x == 0):
        mover_xy_codo_abajo(x,y)
    else:
        if(x>0):
            mover_xy_codo_abajo(x,y)
        if(x<0):
            mover_xy_codo_arriba(x,y)

# Function to move the robot to x,y from a down position
def mover_xy_codo_abajo(x,y):
    L1 = 200
    L2 = 250
    global aux
    global leido
    if y == 0:
        if x>0:
            beta = math.atan(math.inf)
        else:
            beta = -math.atan(math.inf)
    else:
        beta = math.atan(x/y)
    q2 = math.acos(((x*x)+(y*y)-(L1*L1)-(L2*L2))/(2*L1*L2))
    alfa = math.asin((L2*math.sin(q2))/(math.hypot(x,y)))
    q1 = beta-alfa
    Q2 = round(math.degrees(q2),1)
    Q1 = round(math.degrees(q1),1)
    hombro_abs(Q1)
    time.sleep(0.015)
    codo_abs(Q2)
    time.sleep(0.015)
    if((abs(Q1) >= 89.7) and (abs(Q1) < 90.1)):
        while(leido != '1'):
            pass
    if(leido == '1'):
        time.sleep(0.1)
        reset_hombro()
        time.sleep(0.5)
        configurar_hombro()
        time.sleep(0.5)
        leido = ''
        aux = 1

# Function to move the robot to x,y from a top position
def mover_xy_codo_arriba(x,y):
    L1 = 200
    L2 = 250
    global aux
    global leido
    if y == 0:
        if x>0:
            beta = math.atan(math.inf)
        else:
            beta = -math.atan(math.inf)
    else:
        beta = math.atan(x/y)
    q2 = math.acos(((x*x)+(y*y)-(L1*L1)-(L2*L2))/(2*L1*L2))
    alfa = math.asin((L2*math.sin(q2))/(math.hypot(x,y)))
    q1 = alfa+beta
    Q2 = -round(math.degrees(q2),1)
    Q1 = round(math.degrees(q1),1)
    hombro_abs(Q1)
    time.sleep(0.015)
    codo_abs(Q2)
    time.sleep(0.015)
    if((abs(Q1) >= 89.7) and (abs(Q1) < 90.1)):
        while(leido != '1'):
            pass
    if(leido == '1'):
        time.sleep(0.1)
        reset_hombro()
        time.sleep(0.5)
        configurar_hombro()
        time.sleep(0.5)
        leido = ''
        aux = 1
    print('q1')
    print(Q1)
    print('q2')
    print(Q2)

def hombro_quieto():
    global hq
    global leido
    enviar_byte('T')
    enviar_byte('P')
    enviar_byte('1')
    enviar_byte('F')
    if leido == '3':
        hq = 1
        leido = ''
    else:
        hq = 0
    print('hq')
    print(hq)
        
def codo_quieto():
    global cq
    global leido
    enviar_byte('T')
    enviar_byte('P')
    enviar_byte('2')
    enviar_byte('F')
    if leido == '4':
        cq = 1
        leido = ''
    else:
        cq = 0
    print('cq')
    print(cq)

# def abrir():
#     fichero = filedialog.askopenfilename(title="Abrir",filetype=(("Archivos de texto","*.txt"),("Archivos texto","*.txt")))
#     archivo = open(fichero)
#     for linea in archivo:
#         eval(linea)
#     archivo.close()
def cerrar_puerto():#listo
    puerto.close()

def usr_hombro(usr):#listo_trama
    cadena = ''
    usr2 = abs(usr)
    long = len(str(usr2))-1
    if usr < 0:
        cadena = 'S1'+str(long)+'N'+str(usr2)+'F'
    if usr > 0:
        cadena = 'S1'+str(long)+'P'+str(usr2)+'F'
    for i in range(0,len(cadena)):
        enviar_byte(cadena[i])

def usr_codo(usrc):#listo_trama
    cadenac = ''
    usrc2 = abs(usrc)
    longc = len(str(usrc2))-1
    if usrc < 0:
        cadenac = 'S2'+str(longc)+'N'+str(usrc2)+'F'
    if usrc > 0:
        cadenac = 'S2'+str(longc)+'P'+str(usrc2)+'F'
    for i in range(0,len(cadenac)):
        enviar_byte(cadenac[i])
def rotar_hombro(ang):
    user_u = (16384*ang)/(360)
    user_u2 = round(user_u*80)
    print(user_u2)
    usr_hombro(user_u2)
def rotar_codo(angc):
    user_uc = (16384*angc)/(360)
    user_uc2 = round(user_uc*100)
    usr_codo(user_uc2)
def app():
    while True:
        global leido
        global linea
def hombro_abs(th):#listo
    global theta_h
    global mover_h
    mover_h = th - theta_h
    theta_h = theta_h + mover_h
    rotar_hombro(mover_h)
    print('ang hombro ='+str(theta_h))
    print(mover_h)
def codo_abs(ch):#listo
    global theta_c
    global mover_c
    mover_c = ch - theta_c
    theta_c = theta_c + mover_c
    rotar_codo(mover_c)
    print('ang codo ='+str(theta_c))
    print(mover_c)
def curva_suave(x1,y1,x2,y2,T):
    [cabq11,cabq21] = TCI_CODO_ABAJO(x1,y1)
    [cabq12,cabq22] = TCI_CODO_ABAJO(x2,y2)
    [carq11,carq21] = TCI_CODO_ARRIBA(x1,y1)
    [carq12,carq22] = TCI_CODO_ARRIBA(x2,y2)
    daq1u = abs(carq12-carq11)
    daq2u = abs(carq22-carq21)
    daq1d = abs(cabq12-cabq11)
    daq2d = abs(cabq22-cabq21)
    if(x2 == 0):
        #codo abajo
        q11 = math.degrees(cabq11)
        q12 = math.degrees(cabq12)
        q21 = math.degrees(cabq21)
        q22 = math.degrees(cabq22)
    else:
        if(x2>0):
            q11 = math.degrees(cabq11)
            q12 = math.degrees(cabq12)
            q21 = math.degrees(cabq21)
            q22 = math.degrees(cabq22)
        if(x2<0):
            q11 = math.degrees(carq11)
            q12 = math.degrees(carq12)
            q21 = math.degrees(carq21)
            q22 = math.degrees(carq22)
    a1 = (4*abs(q11-q12))/(T*T)
    a2 = (4*abs(q21-q22))/(T*T)
    tao1 = 0.5*(T-math.sqrt((T*T)-4*((abs(q12-q11))/a1)))
    tao2 = 0.5*(T-math.sqrt((T*T)-4*((abs(q22-q21))/a2)))
    v1 = a1*tao1
    v2 = a2*tao2
    v1_usr = round(v1*(10/0.744))
    v2_usr = round(v2*(10/0.595))
    a1_usr = round(a1*(10/0.744))
    a2_usr = round(a2*(10/0.595))
    print('q1:')
    print(q11)
    print(q12)
    print('v1')
    print(v1)
    print(v1_usr)
    print('acc1:')
    print(a1)
    print('q2:')
    print(q21)
    print(q22)
    print('v2')
    print(v2)
    print('acc2:')
    print(a2)
    vel_max_hombro(v1_usr)
    time.sleep(0.05)
    vel_max_codo(v2_usr)
    time.sleep(0.05)
    acc_max_hombro(a1_usr)
    time.sleep(0.05)
    acc_max_codo(a2_usr)
    time.sleep(0.05)
    mover_xy(x2,y2)
##    
def TCI_CODO_ARRIBA(x,y):
    L1 = 200
    L2 = 250
    beta = math.atan(x/y)
    q2 = math.acos(((x*x)+(y*y)-(L1*L1)-(L2*L2))/(2*L1*L2))
    alfa = math.asin((L2*math.sin(q2))/(math.hypot(x,y)))
    q1 = alfa + beta
    return q1,q2
def TCI_CODO_ABAJO(x,y):
    L1 = 200
    L2 = 250
    beta = math.atan(x/y)
    q2 = math.acos(((x*x)+(y*y)-(L1*L1)-(L2*L2))/(2*L1*L2))
    alfa = math.asin((L2*math.sin(q2))/(math.hypot(x,y)))
    q1 = beta - alfa
    return q1,q2
def dibujar_recta(x1,y1,x2,y2,per):#listo
    global hq
    global cq
    vel_max_codo(100)
    time.sleep(0.015)
    acc_max_codo(5000)
    time.sleep(0.015)
    vel_max_hombro(100)
    time.sleep(0.015)
    acc_max_hombro(5000)
    time.sleep(0.015)
    distx = x2-x1
    disty = y2-y1
    deltax = 0.05*distx
    deltay = 0.05*disty
    vx = np.zeros((1,21))   
    vy = np.zeros((1,21))
    vx[0,0] = x1
    vy[0,0] = y1
    if (x1 == x2)or(y1 == y2):
        for i in range(1,21):
            vx[0,i] = vx[0,i-1]+ deltax;
            vy[0,i] = vy[0,i-1] + deltay;
    else:
        for i in range(1,21):
            m = ((y2 - y1)/(x2 - x1))
            b = y1-m*x1
            vx[0,i] = vx[0,i-1]+deltax;
            vy[0,i] = m*vx[0,i]+b;
    mover_xy(x1,y1)
    time.sleep(0.5)
    hombro_quieto()
    hombro_quieto()
    time.sleep(0.05)
    codo_quieto()
    codo_quieto()
    time.sleep(0.05)
    while(hq == 0)or(cq == 0):
        hombro_quieto()
        hombro_quieto()
        time.sleep(0.05)
        codo_quieto()
        codo_quieto()
        time.sleep(0.05)
    print('punto de partida')
    for i in range(1,21):
        curva_suave(vx[0,i-1],vy[0,i-1],vx[0,i],vy[0,i],per/20)
        time.sleep(0.05)
        hombro_quieto()
        hombro_quieto()
        time.sleep(0.05)
        codo_quieto()
        codo_quieto()
        time.sleep(0.05)
        while(hq == 0)or(cq == 0):
            hombro_quieto()
            hombro_quieto()
            time.sleep(0.05)
            codo_quieto()
            codo_quieto()
            time.sleep(0.05)
        print('fin de segmento'+str(i))
def dibujar_circunferencia(x,y,r,dper):#listo
    global hq
    global cq
    per = dper/2
    vel_max_codo(100)
    time.sleep(0.015)
    acc_max_codo(5000)
    time.sleep(0.015)
    vel_max_hombro(100)
    time.sleep(0.015)
    acc_max_hombro(5000)
    time.sleep(0.015)
    h = x
    k = y
    dist = 2*r
    delta = 0.01*dist
    vx = np.zeros((1,101))
    vx2 = np.zeros((1,101))
    vy1 = np.zeros((1,101))
    vy2 = np.zeros((1,101))
    vx[0,0] = h-r
    vy1[0,0] = k
    vy2[0,0] = k
    for i in range(1,101):
        vx[0,i] = vx[0,i-1]+delta;
        vy1[0,i] = k+math.sqrt(abs(r*r - (vx[0,i]-h)*(vx[0,i]-h)))
        vy2[0,i] = k-math.sqrt(abs(r*r - (vx[0,i]-h)*(vx[0,i]-h)))
    for i in range(0,101):
        vx2[0,i] = vx[0,100-i]
    mover_xy(vx[0,0],vy1[0,0])
    time.sleep(0.5)
    hombro_quieto()
    hombro_quieto()
    time.sleep(0.05)
    codo_quieto()
    codo_quieto()
    time.sleep(0.05)
    while(hq == 0)or(cq == 0):
        hombro_quieto()
        hombro_quieto()
        time.sleep(0.05)
        codo_quieto()
        codo_quieto()
        time.sleep(0.05)
    print('punto de partida')
    for i in range(1,101):
        curva_suave(vx[0,i-1],vy1[0,i-1],vx[0,i],vy1[0,i],per/100)
        time.sleep(0.05)
        hombro_quieto()
        hombro_quieto()
        time.sleep(0.05)
        codo_quieto()
        codo_quieto()
        time.sleep(0.05)
        while(hq == 0)or(cq == 0):
            hombro_quieto()
            hombro_quieto()
            time.sleep(0.05)
            codo_quieto()
            codo_quieto()
            time.sleep(0.05)
        print('fin de segmento'+str(i))
    for i in range(1,101):
        curva_suave(vx2[0,i-1],vy2[0,i-1],vx2[0,i],vy2[0,i],per/100)
        time.sleep(0.05)
        hombro_quieto()
        hombro_quieto()
        time.sleep(0.05)
        codo_quieto()
        codo_quieto()
        time.sleep(0.05)
        while(hq == 0)or(cq == 0):
            hombro_quieto()
            hombro_quieto()
            time.sleep(0.05)
            codo_quieto()
            codo_quieto()
            time.sleep(0.05)
        print('fin de segmento'+str(i+100))
    
if __name__ == "__main__":
    while True:
        try:
            if ((leido == '1')and(aux == 0)):
                # text1.insert("insert", "Hombro bloqueado\n")
                leido = ''
            if ((leido == '2')and(aux == 0)):
                # text1.insert("insert", "Codo bloqueado\n")
                leido = ''
            if aux == 1:
                aux = 0
                pass
        except:
            break