class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy, :show]
    def new
        @user = User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id] =  @user.id
            flash[:notice] = "user was created successfully"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
       
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    def show
    end

    def index
        @user = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id]) 
    end

end
