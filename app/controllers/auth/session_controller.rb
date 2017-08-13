class Auth::SessionController < ApplicationController
  def create
    user = Auth::User.find_or_create_by_auth_params!(auth_params, user: current_user)
    sign_in user
    redirect_to root_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
