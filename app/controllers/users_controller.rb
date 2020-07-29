class UsersController < ApplicationController
    # before_action :require_login, only: [:edit, :destroy, :show]
    before_action :current_user
    before_action :find_user, only: [:edit, :update]
    skip_before_action :authorized, only: [:new, :create, :index]
    
    def index
        if params[:search]
            @search_term = params[:search]
            @pets = @pets.search_by(@search_term)
        end

        @users = User.all
    end

    def show  
        @user = User.find(params[:id])
        if @user == @current_user 
          render :show 
        else 
          flash[:error] = "Can only See Your Own Profile"
          redirect_to users_path
        end
    end

    def new     
        @user = User.new
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
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

    def user_params 
        params.require(:user).permit(:name, :email, :search, :password)
    end  

    def current_user
        @current_user = set_user 
    end

end
