class Api::V1::RegistrationsController < ApiBaseController
	def sign_up
		@current_user = User.new(sign_up_params)
		unless @current_user.save
			render json: @current_user.errors, status: :unprocessable_entity
		end
	end
	
	private
	# Never trust parameters from the scary internet, only allow the white list through.
  def sign_up_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :contact_no)
  end
end
