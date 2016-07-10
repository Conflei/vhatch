class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @users = User.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
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

  def post_params
    params.require(:user).permit(:dev_unique_id, :serv_time_creaton, :days_completed, :device_push_id, :name)
  end

end
