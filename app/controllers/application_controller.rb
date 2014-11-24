class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart

  require "prawn"

  Prawn::Document.generate("hello.pdf") do
    text "Hello World!"
  end

  helper_method :current_cart
  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart

    cart = Cart.find_by(id: session[:cart_id])

    unless  cart.present?
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    cart
  end

  before_filter :detect_partial_render

  def detect_ajax
    if params[:ajax] == 'true'
      #default_layout = 'ap'
      #render inline: params.inspect

      #render inline: controller_class_name
      if !controller_class.nil?
        #render inline: 'hello'
        controller_class.layout false
      end
      #render layout: 'modal-layout'
      #render inline: params.inspect
      @modal_id = "#{params[:controller].parameterize.underscore}-#{params[:action]}-#{@_request.method.downcase}"

    else
      if !controller_class.nil?
        #render inline: 'hello'
        controller_class.layout 'application'
      end



    end
  end

  def detect_partial_render
    if params[:load_partial]
      output_data = {}

      params_partial_path = params[:load_partial]
      params_partial_paths = params_partial_path.split(',')
      output_partials = []
      params_partial_paths.each do |partial_path|
        content = render_to_string layout: 'partial-loader', template: 'async_renderer/index', locals: { partial_path: partial_path }

        data_to_output = { partial: content, partial_path: partial_path }
        output_partials.push data_to_output
      end

      output_data[:partials] = output_partials


      json_source = output_data.to_json
      render inline: json_source
    end
  end

end
