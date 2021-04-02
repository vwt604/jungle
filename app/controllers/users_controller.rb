class UsersController < ApplicationController
  def new
  end

  def create
    @user = Users.new(user_params)

    if @user.save
      redirect_to [:admin, :products], notice: 'User created!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
  
end
