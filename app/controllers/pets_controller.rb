class PetsController < ApplicationController
    before_action :set_pet 

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

    def edit
    end

    def update
        @pet = Pet.update(pet_params)

        if @pet.valid?
            redirect_to pet_path(@pet)
        else
            redirect_to new_pet_path(@pet)
    end

    def destroy
        @pet = Pet.destroy
    end

    private

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def pet_params
        params.require(:pet).permit(:name, :age, :breed, :animal_type)
    end
end
