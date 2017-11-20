class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:alert] = "Review Successfully Added"
      redirect_to product_path(@review.product)
    else
      flash[:alert] = "Rating should be between 1 and 5"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:alert] = "Review Successfully Updated"
      redirect_to product_path(@review.product)
    else
      flash[:alert] = "Rating should be between 1 and 5"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end
