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
      if l.quantity
        quantity +=l.quantity
      elsif l.decor_quantity
        quantity +=l.decor_quantity
      elsif l.drink_set_quantity
        quantity +=l.drink_set_quantity
      elsif l.product_pack_id
        quantity +=3
      end
    end
    return quantity
  end

  def get_total_price(current_cart)
    if current_cart && current_cart.line_items.count > 0
      sum = 0
      product_pack_sum = 0
      current_cart.line_items.each do |item|
        if item && item.product_pack_id
          product_pack = ProductPack.where(id: item.product_pack_id).first
          product_pack_percent = product_pack.percent/100.to_f
          tablecloth = Product.where(id: item.p_product_id).first
          if tablecloth && tablecloth.promotion_price
            tablecloth_price = tablecloth.promotion_price
          elsif tablecloth
            tablecloth_price = tablecloth.price
          end
          decor = Decor.where(id: item.p_decor_id).first
          if decor && decor.new_price
            decor_price = decor.new_price
          elsif decor
            decor_price = decor.price
          end
          drink_set = DrinkSet.where(id: item.p_drink_set_id).first
          if drink_set && drink_set.new_price
            drink_set_price = drink_set.new_price
          elsif drink_set
            drink_set_price = drink_set.price
          end

          if tablecloth && decor && drink_set
            product_pack_sum = tablecloth_price + decor_price + drink_set_price
            product_pack_sum = product_pack_sum - (tablecloth_price + decor_price + drink_set_price)*product_pack_percent
          end
          sum = product_pack_sum + sum
        #  sum tablecloth
        elsif item && item.product_id
          if item.product.promotion_price && item.product.promotion_price > 0
            sum = sum + item.product.promotion_price * item.quantity
          else
            sum = sum + item.product.price * item.quantity
          end
        #   sum decors
        elsif item && item.decor_id
          if item.decor.new_price && item.decor.new_price > 0
            sum = sum + item.decor.new_price * item.decor_quantity
          else
            sum = sum + item.decor.price * item.decor_quantity
          end
        #   sum drink sets
        elsif item && item.drink_set_id
          if item.drink_set.new_price && item.drink_set.new_price > 0
            sum = sum + item.drink_set.new_price * item.drink_set_quantity
          else
            sum = sum + item.drink_set.price * item.drink_set_quantity
          end
        end

      end
      return sum
    else
      0
    end
  end

end
