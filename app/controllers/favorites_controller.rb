class FavoritesController < ApplicationController

  def index

  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to favorite_path(@favorite)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def favorite_params
    params.require(:favorite).permit(:pet_id, :user_id)
  end


end
