class StaticPagesController < ApplicationController
  def home
    @tours = Tour.sort_by_name.paginate(page: params[:page],
      per_page: Settings.paginate.page_6)
  end

  def contact
  end
end
