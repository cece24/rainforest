class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    #code
  end

  def create
    #code
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit

  end

  def update
    #code
  end

  def delete
    #code
  end
end
