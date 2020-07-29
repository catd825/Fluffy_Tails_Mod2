class FavoritesController < ApplicationController

  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  skip_before_action :authorized, only: [:index, :show]


  def index
    @favorites = Favorite.all
  end

  def show
  end

  def new
    @favorite = Favorite.new
    @pets = Pet.all
  end

  def create
    favorite = Favorite.where(pet: Pet.find(params[:pet]), user: current_user)
    if favorite == []
      #create the favorite
      Favorite.create(pet: Pet.find(params[:pet]), user: current_user)
      @favorite_exists = true
    else
      #delete the favorite
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update
    favorite = Favorite.where(pet: Pet.find(params[:pet]), user: current_user)
    if favorite == []
      #create the favorite
      Favorite.create(pet: Pet.find(params[:pet]), user: current_user)
      @favorite_exists = true
    else
      #delete the favorite
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :pet_id)
  end



end
