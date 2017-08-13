class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  helper_method :current_user_id, :current_user, :sign_in, :signed_in?

  # @return [Auth::User, nil] The current user if signed in
  def current_user
    @current_user ||= User.find_by(current_user_id)
  end

  # @return [Integer, nil] The current user id if signed in
  def current_user_id
    @current_user_id ||= session[:user_id]
  end

  # @params user [Auth::User] The signed in user
  def sign_in user
    session[:user_id] = user.id
  end

  # @return [Integer, nil] True if signed in
  def signed_in?
    @current_user_id.present?
  end
end
