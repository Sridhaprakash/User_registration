class SessionsController < ApplicationController
    def login
    end

    def create
        @user = User.find_by(email: params[:session][:email])

        if !!@user && @user.authenticate( params[:session][:password])
            session[:user_id] = @user.id
            flash[:notice] = "Logged in successfully"
            redirect_to users_path      
        else
            flash.now[:alert] = "There was something wrong"
            render 'login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to login_path
    end
    
end
