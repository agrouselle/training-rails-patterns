class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.register
      redirect_to @user, notice: 'User was successfully created'
    else
      # ...
    end
  end

  def suspend
    @user = User.find(params[:id])

    # Create new models based on abstraction is a great way to keep your app modular.
    suspension = UserSuspension.new(@user)
    suspension.create!

    redirect_to @user, notice: 'Successfully suspended'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
