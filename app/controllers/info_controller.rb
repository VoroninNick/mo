class InfoController < ApplicationController
  def shipping
    @page = Delivery.where(published: true).first
  end
  def warranty
    @page = Warranty.where(published: true).first
  end
  def payment
    @page = Payment.where(published: true).first
  end

end
