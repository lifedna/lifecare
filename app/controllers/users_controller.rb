class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def avatar
  # 	@user = User.find(params[:id])
  #   content = @user.avatar.read
  #   if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
  #     send_data content, type: @user.avatar.file.content_type, disposition: "inline"
  #     expires_in 0, public: true
  #   end
  # end
end
