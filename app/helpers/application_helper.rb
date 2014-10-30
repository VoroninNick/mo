module ApplicationHelper
  def embedded_svg filename, options={}
    embedded_svg_from_abs(Rails.root.join('app', 'assets', 'images', 'svg', filename), options)
  end

  def embedded_svg_from_abs filename, options = {}
    file = File.read(filename)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def embedded_svg_from_root_directory filename, options = {}
    embedded_svg_from_abs(Rails.root.join( filename), options)
  end

  def self.embedded_svg_js filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def get_count_products
    quantity = 0

    current_cart.line_items.each do |l|
      quantity +=l.quantity
    end
    return quantity
  end

  def get_total_price(current_cart)
    if current_cart && current_cart.line_items.count > 0
      sum = 0
      current_cart.line_items.each do |item|
        if item.product.promotion_price && item.product.promotion_price > 0
          sum = sum + item.product.promotion_price * item.quantity

        else
          sum = sum + item.product.price * item.quantity
        end
      end
      return sum
    else
      "0"
    end
  end

end
