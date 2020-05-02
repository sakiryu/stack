# Stack
Stack data-structure of integers implemented in Dafny

# Enunciado do Problema:

Estamos interessados em implementar o tipo de dados Pilha de tamanho limitado sobre um array.
Para tal será necessário criar uma classe Pilha em Dafny e representar os atributos e método de
acordo com as seguintes instruções. Para fins de simplificação, considere a declaração de pilhas
contendo números naturais e não se preocupe em implementar uma coleção genérica.
Representação abstrata (via ghost):
• Representar a coleção de elementos da pilha como uma sequência em Dafny.
Invariante de classe (via predicate):
• Utilizar um predicado para a invariante da representação abstrata associada à coleção
do tipo pilha.
Operações:
• Construtor deve instanciar uma pilha vazia a partir da informação do tamanho máximo
da pilha.
• Adicionar um elemento no topo pilha e retornar verdadeiro, caso adicionado, falso, caso
a pilha já esteja cheia.
• Remover um elemento do topo da pilha, caso ela não esteja vazia.
• Verificar se a pilha está cheia ou não.
• Verificar se a pilha está vazia ou não.
• Informar o número de elementos armazenados na pilha.
• Informar o tamanho máximo da pilha.
• Inverter a ordem dos elementos da pilha.
Todas as pré-condições, pós-condições e invariantes devem ser corretamente especificadas.
Faz parte da avaliação do trabalho o completo entendimento de quais asserções devem fazer
parte da especificação das operações solicitadas.

Por fim, construa um pequeno método “Main” demonstrando o uso das operações
implementadas e verificando asserções (no estilo de teste unitário).