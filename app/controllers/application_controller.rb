class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "message.alert_login"
    redirect_to login_url
  end

  def load_tours
    @tours = Tour.sort_by_name.paginate(page: params[:page],
      per_page: Settings.paginate.page_6)
  end
end
