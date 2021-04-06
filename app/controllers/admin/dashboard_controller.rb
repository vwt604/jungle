class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("ADMIN_USERNAME"), password: ENV.fetch("ADMIN_PASSWORD")

  def edit
    render plain: "I'm only accessible if you know the password"
  end

  def show
    @products = Product.order(id: :desc).all
    @categories = Category.order(:id).all
  end
  
end
