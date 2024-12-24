class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request, only: [ :login, :new ]

  def new
  end


  # POST /auth/login
  def login
      @user = User.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
          token = jwt_encode(user_id: @user.id)
          cookies.signed[:jwt] = { value: token, httponly: true, secure: Rails.env.production?, expires: 24.hours.from_now }
          respond_to do |format|
            format.html { redirect_to root_path, notice: "Logged in successfully" }
            format.json { render json: { message: "Logged in successfully" }, status: :unauthorized }
          end
      else
        respond_to do |format|
            format.html { redirect_to auth_login_path, alert: "Email o Password incorrectos" }
            format.json { render json: { error: "Email o Password incorrectos" }, status: :unauthorized }
          end
      end
  end
end
