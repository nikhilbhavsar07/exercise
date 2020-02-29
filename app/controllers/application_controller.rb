class ApplicationController < ActionController::API

  def authenticate_user
    @user = User.find_by_email(request.headers["email"])
    token = AuthenticateUser.encode(@user.password_digest) if @user.present?
    if token == request.headers["token"]
      return @user
    else
      render json:{message: "Unauthorized, invalid email or token."}, status: 401
    end
  end

end
