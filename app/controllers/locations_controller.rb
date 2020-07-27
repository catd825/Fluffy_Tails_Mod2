class LocationsController < ApplicationController

    def index 
        @locations = Location.all
    end

    def show  
        find_location
    end

    def new  
        @location = Location.new
    end 

    def create
        @location = Location.create(location_params)
        

        if @location
            redirect_to locations_path  
        else
            redirect_to new_location_path
        end
    end

    def edit 
        find_location
    end

    def update
        location = find_location.update(location_params)
        if location  
            redirect_to location_path(location)
        else
            redirect_to edit_location_path
        end
    end

    def destroy 
        find_location.destroy
        redirect_to locations_path
    end



    private

    def find_location 
        @location = Location.find(params[:id])
    end

    def location_params 
        params.require(:location).permit(:name, :address, :phone)
    end

end
