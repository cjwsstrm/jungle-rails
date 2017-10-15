class ReviewsController < ApplicationController
  
  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    
    @review.user_id = current_user.id

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render template: 'products/show'
    end
  end
  
  def destroy
    @review = Review.find params[:id]
    @product = Product.find(params[:product_id])
    @review.destroy
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
    end

end
