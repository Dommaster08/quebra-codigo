programa{
  funcao inicio() {
  mainLoop()
}

funcao mainLoop() {
  real vetor[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  inteiro sizeTracker = 0
  logico continuar = verdadeiro

  enquanto (continuar) {
    sizeTracker = fase1(vetor, sizeTracker)
    sizeTracker = fase2(vetor, sizeTracker)
    sizeTracker = fase3(vetor, sizeTracker)  // Adicionei esta linha
    escreva("Voc� deseja repetir o programa?\n1 = Sim\n0 = N�o\n-> ")
    leia(continuar)
    se (nao(continuar)) {
      retorne
    }
    escreva("\n")
    mostrarVetor(vetor, sizeTracker)
    escreva("\n")
  }
}

funcao mostrarVetor(real vetor[], inteiro tamanho) {
  escreva("Vetor[] = {")
  para (inteiro i = 0; i < tamanho; i++) {
    escreva(vetor[i])
    se (i < tamanho - 1) {
      escreva(", ")
    }
  }
  escreva("}\n")
}

funcao ordenar(real vetor[], inteiro tamanho) {
  real aux
  para (inteiro i = 0; i < tamanho; i++) {
    para (inteiro j = i + 1; j < tamanho; j++) {
      se (vetor[i] > vetor[j]) {
        aux = vetor[i]
        vetor[i] = vetor[j]
        vetor[j] = aux
      }
    }
  }
}

funcao inteiro fase1(real vetor[], inteiro sizeTracker) {
  logico continuar = verdadeiro
  inteiro opcao
  real insValue
  escreva("----------Fase 1----------\n")

  enquanto (continuar) {
    escreva("Escolha uma op��o:\n1 = Inserir\n2 = Remover\n3 = Pr�xima fase\n-> ")
    leia(opcao)

    escolha (opcao) {
      caso 1:
        se (sizeTracker < 10) {
          escreva("Digite o valor real a ser inserido: ")
          leia(insValue)
          vetor[sizeTracker] = insValue
          sizeTracker = sizeTracker + 1
        } senao {
          escreva("\nVetor cheio.\n\n")
        }
      pare

      caso 2:
        se (sizeTracker > 0) {
          sizeTracker = sizeTracker - 1
        } senao {
          escreva("\nVetor vazio.\n\n")
        }
      pare

      caso 3:
        continuar = falso
      pare
    }
    escreva("\n")
  }
  ordenar(vetor, sizeTracker)
  retorne sizeTracker
}

funcao inteiro fase2(real vetor[], inteiro sizeTracker) {
  inteiro opcao
  escreva("----------Fase 2----------\n")

  escreva("Escolha uma op��o:\n1 = <n�meros primos>\n2 = <n�meros pares>\n3 = <n�meros �mpares>\n-> ")
  leia(opcao)

  escolha (opcao) {
    caso 1:
      escreva("\nAntes: ")
      mostrarVetor(vetor, sizeTracker)
      inteiro novoTamanho = 0
      para (inteiro i = 0; i < sizeTracker; i++) {
        se (vetor[i] > 1) {
          logico primo = verdadeiro
          para (inteiro j = 2; j < vetor[i]; j++) {
            se (vetor[i] % j == 0) {
              primo = falso
              pare
            }
          }
          se (primo) {
            vetor[novoTamanho] = vetor[i]
            novoTamanho = novoTamanho + 1
          }
        }
      }
      sizeTracker = novoTamanho
      ordenar(vetor, sizeTracker)
      escreva("\nDepois: ")
      mostrarVetor(vetor, sizeTracker)
    pare

    caso 2:
      escreva("\nAntes: ")
      mostrarVetor(vetor, sizeTracker)
      inteiro novoTamanho = 0
      para (inteiro i = 0; i < sizeTracker; i++) {
        se (vetor[i] % 2 == 0) {
          vetor[novoTamanho] = vetor[i]
          novoTamanho = novoTamanho + 1
        }
      }
      sizeTracker = novoTamanho
      ordenar(vetor, sizeTracker)
      escreva("\nDepois: ")
      mostrarVetor(vetor, sizeTracker)
    pare

    caso 3:
      escreva("\nAntes: ")
      mostrarVetor(vetor, sizeTracker)
      inteiro novoTamanho = 0
      para (inteiro i = 0; i < sizeTracker; i++) {
        se (vetor[i] % 2 != 0) {
          vetor[novoTamanho] = vetor[i]
          novoTamanho = novoTamanho + 1
        }
      }
      sizeTracker = novoTamanho
      ordenar(vetor, sizeTracker)
      escreva("\nDepois: ")
      mostrarVetor(vetor, sizeTracker)
    pare
  }
  retorne sizeTracker
}

funcao inteiro fase3(real vetor[], inteiro sizeTracker) {
  inteiro opcao, i
  real resultado
  escreva("\n----------Fase 3----------\n")

  escreva("Escolha uma op��o:\n1 = <Adi��o>\n2 = <Subtra��o>\n3 = <Multiplica��o>\n4 = <Divis�o>\n-> ")
  leia(opcao)

  escolha (opcao) {
    caso 1:
      escreva("\nAdi��o de todos os n�meros do vetor: ")
      resultado = 0
      para (i = 0; i < sizeTracker; i++) {
        resultado = resultado + vetor[i]
      }
      escreva(resultado)
    pare

    caso 2:
      escreva("\nSubtra��o de todos os n�meros do vetor: ")
      resultado = vetor[0]
      para (i = 1; i < sizeTracker; i++) {
        resultado = resultado - vetor[i]
      }
      escreva(resultado)
    pare

    caso 3:
      escreva("\nMultiplica��o de todos os n�meros do vetor: ")
      resultado = 1
      para (i = 0; i < sizeTracker; i++) {
        resultado = resultado * vetor[i]
      }
      escreva(resultado)
    pare

    caso 4:
      escreva("\nDivis�o de todos os n�meros do vetor: ")
      resultado = vetor[0]
      para (i = 1; i < sizeTracker; i++) {
        resultado = resultado / vetor[i]
      }
      escreva(resultado)
    pare
  }
  escreva("\n\n")
  retorne sizeTracker
}
