class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for siging up!"
    else
      render "new"
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
