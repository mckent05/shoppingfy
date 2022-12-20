class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    current_user ? sign_in_success : sign_in_failure(resource)
  end

  def sign_in_success
    render json: { message: 'Signed in Successfully.', status: 200 }, status: :ok
  end

  def sign_in_failure(_resource)
    render json: { message: 'Invalid Username or Password.', status: :unauthorized }, status: :unauthorized
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Logged out.', status: 200 }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logged out failure.', status: :unauthorized }, status: :bad_request
  end
end
