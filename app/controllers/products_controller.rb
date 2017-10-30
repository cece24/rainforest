class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "#{ @product.name} has been added successfully!"
      redirect_to product_url(@product)
    else
      render :new
    end
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

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
