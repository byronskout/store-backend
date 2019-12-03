class BasketItemsController < ApplicationController
  include CurrentBasket
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]
  before_action :set_basket, only: [:create]

  def index
    @basket_items = BasketItem.all
  end

  def show
  end

  def new
    @basket_item = BasketItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @basket_item = @basket.add_product(product)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @basket_item.basket, notice: "Added to Basket!" }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to @basket_item, notice: "Basket item was successfully updated." }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @basket = Basket.find(session[:basket_id])
    @basket_item.destroy
    respond_to do |format|
      format.html { redirect_to basket_path(@basket), notice: "Item successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def set_basket_item
    @basket_item = BasketItem.find(params[:id])
  end

  def basket_item_params
    params.require(:basket_item).permit(:product_id)
  end
end
