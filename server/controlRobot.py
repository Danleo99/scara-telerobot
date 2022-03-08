import sys
 
def HolaMundo():
    print('Hola desde Python')


if __name__ == '__main__':
    globals()[sys.argv[1]]()
    sys.stdout.flush()
