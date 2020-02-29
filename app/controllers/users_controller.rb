class UsersController < ApplicationController
  before_action :authenticate_user, except: [:login, :create]

  def show
    render json:{data: @user}, status: 200
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = AuthenticateUser.encode(user.password_digest)
      response.set_header('token', token)
      render json:{message: 'Successfully logged in', data: user }, status: 200 
    else
      render json:{message: "Invalid email or password."}, status: 401
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      token = AuthenticateUser.encode(@user.password_digest)
      response.set_header('token', token)
      render json: {message: 'User created', data: @user}, status: 201 
    else
      render json:{message: @user.errors}, status: 401
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: {message: 'User updated', data: @user}, status: 200 
    else
      render json:{message: @user.errors}, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city)
  end
end
