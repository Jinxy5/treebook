class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

# sign_in (Devise::SessionsController#new) - Permits only the authentication keys (like email)
# sign_up (Devise::RegistrationsController#create) - Permits authentication keys plus password and password_confirmation
# account_update


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_name << :first_name << :last_name
    devise_parameter_sanitizer.for(:sign_in) << :profile_name << :first_name << :last_name
    devise_parameter_sanitizer.for(:account_update) << :profile_name << :first_name << :last_name
  end
end