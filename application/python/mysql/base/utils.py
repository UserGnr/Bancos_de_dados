def conectar():
    """
    Função para conectar ao servidor
    """
    print("Conectar")


def desconectar():
    """
    Função para desconectar do servidor
    """
    print("Desonectar")


def listar():
    """
    Função para listar um produto
    """
    print("Listar")


def inserir():
    """
    Função para inserir um produto
    """
    print("Inserir")


def atualizar():
    """
    Função para deletar um produto
    """
    print("Atualizar")


def deletar():
    """
    Função para deletar um produto
    """
    print("Deletar")


def menu():
    """
    Função para gerar o menu inicial
    """
    print('-------------------------')
    print('Gerenciamento de produtos')
    print('-------------------------')
    print('Selecione uma opção:')
    print("1 - Listar produtos")
    print("2 - Inserir produtos")
    print("3 - Atualizar produtos")
    print("4 - Deletar produtos")
    print("")
    opcao = int(input("Opção: "))
    if opcao in [1, 2, 3, 4]:
        if opcao ==1:
            listar()
        elif opcao ==2:
            inserir()
        elif opcao ==3:
            atualizar()
        elif opcao ==4:
            deletar()
        else:
            print('Opção inválida')
    else:
        print('Opção inválida')