import psycopg2

def conectar():
    """
    Função para conectar ao servidor
    """
    try:
        conn = psycopg2.connect(
            database='pypostgresql',
            host='localhost',
            user='test_user',
            password='123'
        )
        return conn
    except psycopg2.Error as e:
        print(f'Erro na conexão ao PostgreSQL Server: {e}')


def desconectar(conn):
    """
    Função para desconectar do servidor
    """
    if conn:
        conn.close()
        # print("Desonectado")


def listar():
    """
    Função para listar um produto
    """
    conn = conectar()
    cursor = conn.cursor()
    
    cursor.execute('SELECT * FROM produtos')
    produtos = cursor.fetchall()

    print('-------------------')
    print("Listagem")

    if len(produtos) > 0:
        print('-------------------')
        print('Listando produtos:')
        for produto in produtos:
            print(f'ID: {produto[0]}')
            print(f'Produto: {produto[1]}')
            print(f'Preço: {produto[2]}')
            print(f'Estoque: {produto[3]}')
        print('-------------------')
    else:
        print('Não existem produtos cadastrados.')
    desconectar(conn)

def inserir():
    """
    Função para inserir um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    print('-------------------')
    print("Inserção")

    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe a quantidade em estoque: '))

    cursor.execute(f"INSERT INTO produtos (nome,preco,estoque) VALUES ('{nome}', {preco}, {estoque})")
    conn.commit()

    if cursor.rowcount == 1:
        print(f'O produto {nome} for inserido com sucesso.')
    else:
        print('Não foi possível inserir o produto.')
    
    print('-------------------')

    desconectar(conn)


def atualizar():
    """
    Função para deletar um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    print('-------------------')
    print("Atualização: ")

    codigo = int(input('Informe o código(ID) do produto: '))
    nome = input('Informe o novo nome do produto: ')
    preco = float(input('Informe o novo preço do produto: '))
    estoque = int(input('Informe a nova quantidade em estoque: '))

    cursor.execute(f"UPDATE produtos SET nome='{nome}', preco={preco}, estoque={estoque} WHERE id={codigo}")
    conn.commit()

    if cursor.rowcount == 1:
        print(f'O produto {nome} foi atualizado com sucesso.')
    else:
        print('Erro ao atualizar o produto.')
    
    print('-------------------')
    
    desconectar(conn)


def deletar():
    """
    Função para deletar um produto
    """

    conn = conectar()
    cursor = conn.cursor()

    print('-------------------')
    print("Deleção: ")

    codigo = int(input('Informe o código (ID) do produto: '))

    cursor.execute(f'DELETE FROM produtos WHERE id={codigo}')
    conn.commit()

    if cursor.rowcount == 1:
        print('Produto excluído com sucesso.')
    else:
        print(f'Erro ao excluir o produto com ID = {codigo}')
    desconectar(conn)

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
