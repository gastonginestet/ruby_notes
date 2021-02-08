class ApplicationController < ActionController::Base
  include Pundit
  before_action :require_login

  private

  def not_authenticated
    redirect_to new_session_path
  end
end
