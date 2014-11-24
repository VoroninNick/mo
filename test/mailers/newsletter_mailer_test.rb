require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "order_product" do
    mail = NewsletterMailer.order_product
    assert_equal "Order product", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "call_order" do
    mail = NewsletterMailer.call_order
    assert_equal "Call order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "build_product" do
    mail = NewsletterMailer.build_product
    assert_equal "Build product", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "feedback" do
    mail = NewsletterMailer.feedback
    assert_equal "Feedback", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
