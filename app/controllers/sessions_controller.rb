class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:users)
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users)
  end
end
