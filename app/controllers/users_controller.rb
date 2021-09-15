class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show; end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: "User #{ @user.email } wase successfully updated"
    else
      render :edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(*User::ATTRIBUTE_WHITELIST)
  end
end
