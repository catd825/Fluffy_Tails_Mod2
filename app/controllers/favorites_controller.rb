class FavoritesController < ApplicationController

  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  skip_before_action :authorized, only: [:index, :show]

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


end
