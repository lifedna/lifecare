class GridfsController < ApplicationController
  before_filter :authenticate_user!

  def avatar
  	@user = User.find(params[:id])
    content = @user.avatar.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  def thumb_avatar
    @user = User.find(params[:id])
    content = @user.avatar.thumb.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end
end
