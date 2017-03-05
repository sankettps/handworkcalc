# @tag Sign In
# API for get authentication token
class Api::V1::AuthenticationController < ApiBaseController
	
	# Authenticates a user
  #
  # @body_parameter [string] email
  # @body_parameter [string] password
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  # render with 404 if no routes match
  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render :json => {:error => error}, :status => status
	end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
