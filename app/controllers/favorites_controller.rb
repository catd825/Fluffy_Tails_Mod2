class FavoritesController < ApplicationController

  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to user_path(@favorite)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :pet_id)
  end



end
