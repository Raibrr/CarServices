class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_request

  include JsonWebToken

  private

  def authenticate_request
      header = request.headers["Authorization"]
      header = header.split(" ").last if header
      token = cookies.signed[:jwt]

      if token
        decoded = jwt_decode(token)
      else
        decoded = jwt_decode(header)
      end

      if decoded == "Token not found" || !token
        respond_to do |format|
          format.html { redirect_to auth_login_new_path, alert: "Favor de autenticarse" }
          format.json { render json: { error: "Favor de autenticarse" }, status: :unauthorized }
        end
      else
          @current_user = User.find(decoded[:user_id])
      end
  end
end
