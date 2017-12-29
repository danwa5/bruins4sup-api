class ApplicationController < ActionController::API
  # @TODO - this is a HACK!!! Need to fix this
  # before_action :set_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # private
  #
  # def set_current_user
  #   session[:user_id] = User.first.id if session[:user_id].blank?
  # end
end
