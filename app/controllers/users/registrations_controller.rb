class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed(resource)
  end

  def register_success
    render json: { message: 'Succesfully Signed up.', status: 200 }, status: :created
  end

  def register_failed(resource)
    render json: { message: 'Sign up failure.', error: resource.errors.full_messages.first, status: 400 },
           status: :bad_request
  end
end
