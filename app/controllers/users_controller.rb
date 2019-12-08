class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def show
    @user = User.find(params[:id])
  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Events!"
      redirect_to @user
    else
      render 'new'
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
