class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[new create]
  # index para Developer

  def index
    @users = User.all
  end
  # acciones para la creacion de un Developer

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:users, notice: 'User was successfully created')
    else
      render :new
    end
  end

  def edit; end

  # accion para la vista de un Developer

  def show; end
  # acciones para la edicion de un Developer

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # accion para el borrado de un Developer
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
