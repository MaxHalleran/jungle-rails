class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find_by_id(params[:product_id])
    @review = @product.reviews.new({
      description: params[:review][:description],
      rating: params[:rating]
    })
    @review.user_id = current_user.id
    if @review.save
      redirect_to :back
    else
      flash.now.alert = "Something went wrong!"
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end

  def require_login
    puts current_user
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to :back # halts request cycle
    end
  end

end


