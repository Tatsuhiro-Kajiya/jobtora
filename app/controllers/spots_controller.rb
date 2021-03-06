class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @sopts = Spot.order("createed_at DESC")
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :genre_id, :place_id, :explanation, :plan, :wifi_id, :budget, :image).merge(user_id: current_user.id)
  end
end
