class BasketsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_basket
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    @baskets = Basket.all
  end

  def show
  end

  def new
    @basket = Basket.new
  end

  def edit
  end

  def create
    @basket = Basket.new(basket_params)

    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: "Basket was successfully created." }
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: "Basket was successfully updated." }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @basket.destroy if @basket.id == session[:basket_id]
    session[:basket_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Items removed" }
      format.json { head :no_content }
    end
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.fetch(:basket, {})
  end

  def invalid_basket
    logger.error "Basket #{params[:id]} invalid"
    redirect_to root_path, notice: "Basket doesn't exist"
  end
end
