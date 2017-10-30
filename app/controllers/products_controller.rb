class ProductsController < ApplicationController
  before_action :find_product, only: %i(show edit update destroy)

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
    @review = @product.reviews.new
  end

  def edit
  end

  def update
    @product.update(product_params)

    if @product.save
      flash[:notice] = "#{ @product.name } has been updated!"
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product has been deleted!"
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
