class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :user_params,only: [:create]

  def index
    @users = User.all
  end

  def create
    @mUser = User.new(user_params)

    if @mUser.save
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

  private

  def user_params
    params.require(:mUser).permit(:dev_unique_id, :serv_time_creaton, :days_completed, :device_push_id, :name)
  end

end
