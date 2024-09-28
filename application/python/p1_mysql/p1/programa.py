from utils import menu

if __name__ == '__main__':
    i = True
    while i:
        menu()
        r = input('Deseja continuar? [N - para sair] ')
        if r == 'N' or r == 'n' :
            i = False