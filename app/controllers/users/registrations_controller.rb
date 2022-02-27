# app/controllers/auth/registrations_controller

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_parameters, :only=>[:create]


  def create
    super
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname,:lastname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:firstname,:lastname])
    end

  private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?
      register_failed
    end

    def register_success
      render json: {
        message: 'Registration Successful.',
        user: current_user
      }, status: :ok
    end

    def register_failed
      render json: { 
        message: 'Something went wrong.',
        errors:  resource.errors 
        
        }, status: :unprocessable_entity
    end
end

