class ProductsController < ApplicationController

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # render: :index (implicit)


  end

  def show
    # any of these @ instance variables will be available at render 'show' 
    @product = Product.find params[:id]


    
  end

end
