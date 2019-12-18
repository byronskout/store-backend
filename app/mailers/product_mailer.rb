class ProductMailer < ApplicationMailer
  def new_product_email
    @product = params[:product]

    mail(to: "info@n.com", subject: "New product!")
  end
end
