class ProductsController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :authorize, only: [:create]
  before_action :authorize, only: [:edit]
  before_action :authorize, only: [:update]
  before_action :authorize, only: [:destroy]

  def index
    if params[:sort] == "three_most_recent"
      @products = Product.three_most_recent
    elsif params[:sort] == "most_reviews"
      @products = Product.most_reviews
    elsif params[:sort] == "usa"
      @products = Product.usa
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # messing with alerts!
      flash[:notice] = "Wine Successfully added"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:grape, :name, :cost, :country)
  end
end
