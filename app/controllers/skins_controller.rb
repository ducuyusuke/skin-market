class SkinsController < ApplicationController
  before_action :set_skin, only: %i[show]

  def index
    @skins = Skin.all
  end

  def new
    @skin = Skin.new
  end

  def create
    @skin = Skin.new(skin_params)
    @skin.user = current_user
    if @skin.save
      redirect_to skin_path(@skin)
    else
      render :new
    end
  end

  def show
    @order = Order.new
  end

  private

  def skin_params
    params.require(:skin).permit(:name, :price, :comment)
  end

  def set_skin
    @skin = Skin.find(params[:id])
  end
end
