class CustomizedForm < ActionMailer::Base
  default from: "Magia Obrus <support@voroninstudio.eu>"
  default to: 	"nazariy.papizh@gmail.com"

  def send_customized_data(first_name, last_name, phone, email, message)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @email = email
    @message = message
    to = []
    to = EmailTo.first.customized_form.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'customized_form', :subject => "Форма індивідуального замовлення ...", to: to)
  end

  def send_call_order_data(first_name, last_name, phone)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    to = []
    to = EmailTo.first.call_order_form.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'call_order', :subject => "Форма замовлення дзвінка ...", to: to)
  end

  def send_contact_form_data(first_name, last_name, phone, email, message)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @email = email
    @message = message
    to = []
    to = EmailTo.first.feedback_form.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'contact_from', :subject => "Форма зворотнього зв'язку ...", to: to)
  end

  def order_product_data(first_name, last_name, phone, email, message, cart)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @email = email
    @message = message
    @cart = Cart.find(cart)

    to = []
    to = EmailTo.first.feedback_form.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'order_product', :subject => "Замовлення продукта", to: to)

  end

end
