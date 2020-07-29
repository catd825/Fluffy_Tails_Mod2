class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :upate, :edit, :destroy]
    before_action :current_user
    skip_before_action :authorized, only: [:index, :show]

    def index
        if params[:search]
            @search_term = params[:search]
            @pets = Pet.search_by(@search_term)
        else
            @pets = Pet.all
        end
        # @current_user = set_user
        # byebug
    end

    def show
    end

    def new
        @pet = Pet.new
        @locations = Location.all
    end

    def create
        @pet = Pet.create(pet_params)
        if @pet.valid?
            redirect_to pet_path(@pet)
        else
            flash[:errors] = @pet.errors.full_messages
            redirect_to new_pet_path(@pet)
        end
    end

    def edit
    end

    def update

        @favorite_exists = Favorite.where(pet: @pet, user: current_user) == [] ? false : true

        @pet = Pet.update(pet_params)

        if @pet.valid?
            redirect_to pet_path(@pet)
        else
            redirect_to new_pet_path(@pet)
        end
    end

    def destroy
        set_pet.destroy
        redirect_to pets_path
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :age, :breed, :animal_type, :img_url, :location_id)
    end

    def current_user
        @current_user = set_user 
    end

end
