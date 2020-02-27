class HomesController < ApplicationController
  def show
    render json: {message: 'Welcome to excercise api app!'}
  end
end
