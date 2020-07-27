class UsersController < ApplicationController

    
    def index 
        @users = User.all
    end

    def show  
        find_user
    end

    def new  
        @user = User.new
    end 

    def create
        @user = User.create(user_params)


        if @user
            redirect_to users_path  
        else
            redirect_to new_user_path
        end
    end

    def edit 
        find_user
    end

    def update
        if find_user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path
        end
    end

    def destroy 
        find_user.destroy
        redirect_to users_path
    end



    private

    def find_user 
        @user = User.find(params[:id])
    end

    def location_params 
        params.require(:user).permit(:name, :email)
    end  

end
