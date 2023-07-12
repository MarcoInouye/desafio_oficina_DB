# formato do menu
menu = """

 [1] Depósito
 [2] Sacar
 [3] Extrato
 [0] Sair
 => """

# strings

saldo = 0
limite = 500
extrato = ""
numero_saques = 0 
LIMITE_SAQUES = 3

#operações bancárias

while True:
    opcao = input(menu)
 # Operação de Depósito
    if opcao == "1":
         valor = float(input("informe o valor desejado para o depósito: "))

         if valor > 0: 
            saldo += valor
            extrato += f"depósito: R$ {valor:.2f}\n"
            print(f"O depósito no valor de R${valor:.2f} foi realizado com sucesso!") 
    
         else:
            print("A operação falhou! Valor informado é inválido.")

# Operação de Saque

    elif opcao == "2":
      valor = float(input("informe o valor de saque: "))

      if valor > saldo:
        print("Desculpe, mas você não pode sacar um valor superior ao seu saldo.")

      elif valor > limite:
        print(f"Desculpe, mas você não pode sacar um valor superior ao seu limite de saque (R${limite:.2f}).")
    
      elif numero_saques >= LIMITE_SAQUES:
        print("Desculpe, mas você já ultrapssou o limite de saques diários")
      
      else: 
        extrato += f"Saque: R$ {valor:.2f}\n"
        print(f"Saque no valor de R${valor:.2f} foi realizado com sucesso!")

# Operação de Extrato

    elif opcao == "3":
        print("\n========== EXTRATO ==========")
        print("Não foram realizadas transações." if not extrato else extrato)
        print("\nSaldo: R$ {saldo:.2f}")
        print("=============================")
# Operação de Sair 
    elif opcao == "0":
        print("Operações finalizadas!")
        break
# Essa condiçâo 
    else:
        print("Operação inválida, por favor selecione uma das operações desejadas.")
