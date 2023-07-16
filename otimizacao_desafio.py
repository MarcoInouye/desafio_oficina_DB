import textwrap

# função menu
def menu():
    menu = """
    ========== MENU ===========
    [1]\tDepósito
    [2]\tSacar
    [3]\tExtrato
    [4]\tNova Conta
    [5]\tListar Contas
    [6]\tNovo usuário
    [0]\tSair
    => """
    return input(textwrap.dedent(menu))

# função de depósito
def depositar(saldo, valor, extrato, /):

    if valor > 0: 
            saldo += valor
            extrato += f"depósito:\tR$ {valor:.2f}\n"
            print(f"\nO depósito no valor de R${valor:.2f} foi realizado com sucesso!") 
    
    else:
            print("\nA operação falhou! Valor informado é inválido.")

            return saldo, extrato

# função de saque
def sacar(*, saldo, valor, extrato, limite, numero_saques, limite_saques):
         saldo_excedido = valor > saldo
         limite_excedido = valor > limite
         numero_saques_excedidos = numero_saques >= limite_saques
     
         if saldo_excedido:
             print("Desculpe, mas você não pode sacar um valor superior ao seu saldo.")

         elif limite_excedido:
             print(f"Desculpe, mas você não pode sacar um valor superior ao seu limite de saque (R${limite:.2f}).")
    
         elif numero_saques_excedidos:
             print("Desculpe, mas você já ultrapssou o limite de saques diários")
      
         elif valor > 0:
             saldo -= valor 
             extrato += f"Saque:\t\tR$ {valor:.2f}\n"
             numero_saques += 1
             print(f"Saque no valor de R${valor:.2f} foi realizado com sucesso!")
        
         else: 
             print("A operação falhou! Por favor informe um valor válido!")
             
        
         return saldo, extrato

# função de extrato
def extrato(saldo, /, *, extrato):
     print("\n========== EXTRATO ==========")
     print("Não foram realizadas transações." if not extrato else extrato)
     print("\nSaldo: R$ {saldo:.2f}")
     print("=============================")

# função nova conta
def nova_conta(agencia, numero_conta, usuarios):
     cpf = input("Informe o CPF do usuário: ")
     usuario = filtrar_usuario(cpf, usuarios)

     if usuario:
         print("\n Conta criada com sucesso! ")
         return {"agencia": agencia, "numero_conta": numero_conta, "usuario": usuario} 
     
     print("\nA operação falhou! Usuário não encontrado!")

# função listagem de contas
def listar_contas(contas):
     for conta in contas:
          linha = f"""\
             Agência:\t{conta['agencia']}
             C/C:\t\t{conta['numero_conta']}
             Titular:\t{conta['usuario']['nome']}
          """
          print("=" * 100)
          print(textwrap.dedent(linha))

# função novo usuário
def novos_usuarios(usuarios):
     cpf = input("Informe o seu CPF (somente os números): ")
     usuario = filtrar_usuario(cpf, usuarios)

     if usuario: 
          print("\nJá existe um usuário com esse CPF cadastrado!")
          return
     nome = input("Informe o seu nome completo: ")
     data_nascimento = input("Informe a sua data de nascimento (utilize a formatação: dd/mm/aaaa): ")
     endereco = input("Informe seu endereço (Utilize a formatação: Rua, numero - Bairro - cidade / sigla do estado): ")

     usuarios.append({"nome": nome, "data_nascimento": data_nascimento, "cpf": cpf, "endereco": endereco})
     
     print("O usuário:")
     print("================")
     print(f"\nNome completo: {nome} \nData de nascimento: {data_nascimento} \nCPF: {cpf} \nEndereço: {endereco}\n ")
     print("================")
     print("Foi registrado com sucesso!")

# função de filtro dos usuários
def filtrar_usuario(cpf, usuarios):
     usuarios_filtrados = [usuario for usuario in usuarios if usuario ["cpf"] == cpf]
     return usuarios_filtrados[0] if usuarios_filtrados else None

# função main
def main():
#strings fixas
    LIMITE_SAQUES = 3
    AGENCIA = "0001"
#strings variaveis
    saldo = 0
    limite = 500
    extrato = ""
    numero_saques = 0 
    usuarios = []
    contas = []
    
    while True:
        opcao = menu()

 # Operação de Depósito

        if opcao == "1":
            valor = float(input("informe o valor desejado para o depósito: "))

            saldo, extrato = depositar(saldo, valor, extrato)

# Operação de Saque

        elif opcao == "2":
            valor = float(input("informe o valor de saque: "))

            saldo, extrato = sacar(
                 saldo = saldo,
                 valor = valor,
                 extrato = extrato,
                 limite = limite, 
                 numero_saques= numero_saques,
                 limite_saques= LIMITE_SAQUES,
            )

# Operação de Extrato

        elif opcao == "3":
            extrato(saldo, extrato=extrato)

# Operação de criação de contas 
        elif opcao == "4":
            numero_conta = len(contas) + 1 
            conta = nova_conta(AGENCIA, numero_conta, usuarios)

            if conta:
                 contas.append(conta)

 # Operação de listagem de contas 
        elif opcao == "5": 
            listar_contas(contas)

# Operação de novos usuários 
        elif opcao == "6":
             novos_usuarios(usuarios)

# Operação de Sair 
        elif opcao == "0":
            print("Operações finalizadas!")
            break

#  Else condiçâo 
        else:
            print("Operação inválida, por favor selecione uma das operações desejadas.")

main()