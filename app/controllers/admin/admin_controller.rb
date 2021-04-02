class Admin::AdminController < ApplicationController
  before_action :logged_in_user, :handle_accept

  private

  def handle_accept
    return if curent_user.admin?

    flash[:warning] = "Bạn không có quyền truy cập"
    redirect_to root_path
  end
end
