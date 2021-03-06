class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :user_params,only: [:create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json:
      {
        status: 200,
        message: "User Created"
      }
    else
      render json:
      {
        status: 501,
        message: "User Not Created"
      }
    end
  end

  def exists
    if User.where(:dev_unique_id => params[:dev_unique_id]).any?
      render json:
      {
        status: 200,
        query: "true"
      }
    else
      render json:
      {
        status: 200,
        query: "false"
      }
    end
  end

  private

  def user_params
    params.permit(:dev_unique_id, :serv_time_creaton, :days_completed, :device_push_id, :name)
  end

end
