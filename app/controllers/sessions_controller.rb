class SessionsController < ApplicationController

    def new
    end
  
    def create
      return redirect_to(controller: 'sessions',
                         action: 'new') if !params[:name] || params[:name].empty?
      session[:name] = params[:name]
      redirect_to controller: 'users', action: 'index'
    end
  
    def destroy
      session.delete :name
      redirect_to controller: 'users', action: 'index'
    end

    private
    
    def login_params
        params.require(:user).permit(:name, :password)
    end
end