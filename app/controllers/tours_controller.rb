class ToursController < ApplicationController
  before_action :load_tour, :build_booking_tour, only: :show

  def show; end

  def index
    @tours = Tour.sort_by_name
      .paginate(page: params[:page], per_page: Settings.paginate.page_6)
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:error] = "Da co loi xay ra, vui long load lai page"
    redirect_to tours_path
  end

  def build_booking_tour
    @booking_tour = @tour.booking_tours.new
  end
end
