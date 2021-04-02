class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def edit
    render plain: "I'm only accessible if you know the password"
  end

  def show
    @products = Product.order(id: :desc).all
    @categories = Category.order(:id).all
  end
  
end
