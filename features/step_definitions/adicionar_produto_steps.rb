# frozen_string_literal: true

Dado('que eu esteja na página home') do
  @adc_product = AdcProduct.new
  @adc_product.load
end

Quando('seleciono um produto') do
  @adc_product.selecionar_produto
  expect(@adc_product.texto_pdp.text).to eql(MASSA['validacoes_smiles']['texto_pdp'])
  expect(@adc_product.partner_pdp.text).to eql(MASSA['validacoes_smiles']['texto_pdp_smiles'])
end

E('adiciono um produto ao carrinho') do
  @adc_product.adicionar_transferencia
end

Entao('verifico que o produto foi adicionado ao carrinho') do
  expect(@adc_product.header_carrinho.text).to eql(MASSA['validacoes_carrinho']['header'])
  expect(@adc_product.icon_carrinho.visible?).to be_truthy
  expect(@adc_product.info_produto_carrinho.text.split("\n").last).to eql(MASSA['validacoes_carrinho']['info_parceiro'])
  expect(@adc_product.valor_carrinho.text).to eql(MASSA['validacoes_carrinho']['valor_carrinho'])
  expect(@adc_product.resumo_pedido.text).to eql(MASSA['validacoes_carrinho']['resumo_pedido'])
end
