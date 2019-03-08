class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.likes(micropost)
    flash[:success] = 'ポストをいいねしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlikes(micropost)
    flash[:success] = 'ポストのいいねを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
