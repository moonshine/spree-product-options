module Spree::ProductOptions::ProductsController
  def self.included(controller)
    controller.append_before_filter :define_2d_option_matrix, :only => :show 
  end
  def define_2d_option_matrix
logger.warn "steph inside here!"
    variants = Spree::Config[:show_zero_stock_products] ?
      object.variants.active.select { |a| !a.option_values.empty? } :
      object.variants.active.select { |a| !a.option_values.empty? && a.in_stock }
    return if variants.empty? ||
      object.option_types.select { |a| a.presentation == 'PO_Size' }.empty? ||
      object.option_types.select { |a| a.presentation == 'PO_Color' }.empty?
    variant_ids = {}
    sizes = []
    colors = []
logger.warn "steph inside here! 1"
    variants.each do |variant|
      active_size = variant.option_values.select { |a| a.option_type.presentation == 'PO_Size' }.first
      active_color = variant.option_values.select { |a| a.option_type.presentation == 'PO_Color' }.first
      variant_ids[active_size.id.to_s + '_' + active_color.id.to_s] = variant.id
      sizes << active_size
      colors << active_color
    end
    size_sort = Hash['S', 0, 'M', 1, 'L', 2, 'XL', 3]
    @sc_matrix = { 'sizes' => sizes.sort_by { |s| size_sort[s.presentation] }.uniq,
        'colors' => colors.uniq,
        'variant_ids' => variant_ids }
  end
end
