# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[
        last_name
        first_name
        user_name
      ]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[
        last_name
        first_name
        user_name
      ]
    )
  end
end
