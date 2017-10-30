class ReviewsController < ApplicationController
  before_action :load_product
  before_action :load_review, only: %i(edit update destroy)

  def create
    @review = @product.reviews.build(review_params)

    if @review.save
      flash[:notice] = "Thank you, your review has been submitted!"
      redirect_to product_url(@product)
    else
      flash[:alert] = "Sorry, there was a problem with your review!"
      render "products/show"
    end
  end

  def edit
  end

  def update
    @review.update(review_params)

    if @review.save
      flash[:notice] = "You have updated your review!"
      redirect_to product_url(@product)
    else
      flash[:alert] = "Sorry, there was a problem with your review!"
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = "The review has been deleted!"
    redirect_to product_url(@product)
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def load_review
    @review = @product.reviews.find(params[:id])
  end
end
