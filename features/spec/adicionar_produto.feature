#language: pt

Funcionalidade: Adicionar produto ao carrinho
  Como um cliente Livelo
  Realizo o acesso ao site de pontos
  Para que eu possa adicionar um produto no carrinho

  @adicionar_produto
  Cenário: adicionar_produto
    Dado que eu esteja na página home
    Quando seleciono um produto
    E adiciono um produto ao carrinho
    Entao verifico que o produto foi adicionado ao carrinho
