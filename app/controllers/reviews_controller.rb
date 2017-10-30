class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
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
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
