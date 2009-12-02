# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ProductOptionsExtension < Spree::Extension
  version "1.0"
  description "2 Dimensional Product Optioning"
  url "http://www.endpoint.com/"

  def activate
    ProductsController.class_eval do
      include ProductOptionsExtension::ProductsControllerOverride
    end
  end
end
