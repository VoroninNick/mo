# Preview all emails at http://localhost:3000/rails/mailers/newsletter_mailer
class NewsletterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/order_product
  def order_product
    NewsletterMailer.order_product
  end

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/call_order
  def call_order
    NewsletterMailer.call_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/build_product
  def build_product
    NewsletterMailer.build_product
  end

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/feedback
  def feedback
    NewsletterMailer.feedback
  end

end
