class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    raise @categories.inspect
  end

  def new
    @category = Category.new
  end
end
