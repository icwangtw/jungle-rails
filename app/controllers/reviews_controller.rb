class ReviewsController < ApplicationController

  before_filter :create

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    if @review.save
      redirect_to :back, notice: 'Thank you for your review!'
    else
      redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
