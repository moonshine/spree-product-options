class ProductOptionsExtension < Spree::Extension
  version "1.1"
  description "2-Dimensional Product Optioning"
  url "http://www.endpoint.com/"

  def activate
    ProductsController.send(:include, Spree::ProductOptions::ProductsController)
  end
end
