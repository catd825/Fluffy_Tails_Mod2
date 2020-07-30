class FavoritesController < ApplicationController

  #before_action only: [:show, :update, :edit, :destroy, :new]
  skip_before_action :authorized, only: [:index, :show, :update, :edit, :new]


  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
    #@pet = Pet.find_by(id: )
    @pets = Pet.all
  end

  def create
    @current_user.favorites << Favorite.create(favorite_params)
    redirect_back(fallback_location: pets_path)
  end

  def update
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.delete
    redirect_to user_path(@current_user)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:pet_id)
  end



end
