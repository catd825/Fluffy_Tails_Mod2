class FavoritesController < ApplicationController

  before_action :set_pet, only: [:show, :update, :edit, :destroy]
  skip_before_action :authorized, only: [:index, :show]




end
