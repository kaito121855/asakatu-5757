class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update

  private

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
