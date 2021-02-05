# frozen_string_literal: true

class AdcProduct < SitePrism::Page # :nodoc:
  set_url :'https://www.livelo.com.br/'

  element :hover_transfira_pontos, '#span-first-level-menu-3'
  element :hover_outros_programas, '#span-second-level-menu-3-1'
  element :hover_smiles, '#span-third-level-menu-3-1-2'
  element :valor_transferencia, '#cc-input-quantity'
  element :btn_transfira_seus_pontos, '#cc-btn-transfer'
  element :btn_confirmar_transferencia, '#cc-product-btn-add'
  element :subtotal_pedido, '#cc-cart-total'
  element :btn_fechar_pedido, '#ctaCheckout'
  element :inpt_cupom, '#cc-cupom-field'
  element :header_carrinho, '.cart-list__header'
  element :icon_carrinho, '#cc-checkout-header-cart-icon'
  element :info_produto_carrinho, '.cart-list__prodinfo'
  element :valor_carrinho, '.cart-list__value'
  element :resumo_pedido, '.cart-summary__aside-tilte'
  element :texto_pdp, '#div-productDetails > div.product-details__infos > h2 > span'
  element :partner_pdp, '#div-productDetails > div.product-details__infos > h2 > strong'

  def selecionar_produto
    sleep(5) #aguardo carregamento do modal
    page.windows[0].maximize
    hover_transfira_pontos.hover
    hover_outros_programas.hover
    hover_smiles.click
    sleep(5) if partner_pdp.text.eql?('')
  end

  def adicionar_transferencia
    valor_transferencia.double_click.set(MASSA['valor_transferencia'])
    btn_transfira_seus_pontos.click
    btn_confirmar_transferencia.click
    sleep(10) #aguardo carregamento do modal
  end
end
