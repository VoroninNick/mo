class NewsletterMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.order_product.subject
  #
  def order_product
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.call_order.subject
  #
  def call_order(email)

    mail to: email, subject: "Замовлення зворотнього зв'язку"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.build_product.subject
  #
  def build_product
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.feedback.subject
  #
  def feedback
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
