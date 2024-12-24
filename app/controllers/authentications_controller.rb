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
          redirect_to root_path, notice: "Logged in successfully"
      else
          redirect_to auth_login_path, alert: "Email o Password incorrectos"
      end
  end
end
