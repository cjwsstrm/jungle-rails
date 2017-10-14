class ReviewsController < ApplicationController

  before_filter :authenticate
  
  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    
    @review.user_id = current_user
    

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render template: 'products/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :product_id, :description, :rating)
    end

end
