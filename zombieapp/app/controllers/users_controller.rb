class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.register
      redirect_to @user, notice: 'User was successfully created'
    else
      # ...
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
