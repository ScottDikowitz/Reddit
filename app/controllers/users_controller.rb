class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_users_url
    end
  end

  def show
  end
end
