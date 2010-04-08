class ProductOptionsHooks < Spree::ThemeSupport::HookListener
  replace :inside_product_cart_form, 'products/option_cart_form'
end
