class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :upate, :edit, :destroy]

    def index
        @pets = Pet.all
    end

    def show
    end

    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.create(pet_params)

        if @pet.valid?
            redirect_to pet_path(@pet)
        else
            redirect_to new_pet_path(@pet)
        end
    end

    def edit
    end

    def update
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
        params.require(:pet).permit(:name, :age, :breed, :animal_type, :img_url)
    end

end
