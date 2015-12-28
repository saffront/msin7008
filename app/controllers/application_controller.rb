class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password, :password_confirmation)} 
  		devise_parameter_sanitizer.for(:sign_up) << :name
	    devise_parameter_sanitizer.for(:account_update) << :name
  	end

  def index
    @links = Link.all.order("created_at DESC")
  end﻿
  
end
end
