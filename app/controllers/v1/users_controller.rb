class V1::UsersController < ApplicationController
  def index
    render json: User.all 
  end

  def show
    u = User.find(params[:id])
    render json: u
  end
end
