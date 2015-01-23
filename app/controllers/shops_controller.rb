class ShopsController < ApplicationController
  def index
    @shops = Shop.order(:name)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path
    else
      render :edit
    end
  end

  def destroy
    Shop.find(params[:id]).destroy!
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :host, :token,
      :madmimi_api_key, :madmimi_email, :madmimi_list_name
      )
  end
end
