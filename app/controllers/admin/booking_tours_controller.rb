class Admin::BookingToursController < ApplicationController
  before_action :load_booking_tours
  before_action :load_booking_tour, except: %i(index)

  def index; end

  def rejected_booking
    @booking_tour.rejected!
    flash[:success] = "Da thuc hien update thanh cong"
  rescue
    flash[:error] = "Da co loi xay ra, vui long load lai page"
  ensure
    respond_to do |format|
      format.js
    end
  end

  def approved_booking
    @booking_tour.approved!
    flash[:success] = "Da thuc hien update thanh cong"
  rescue
    flash[:error] = "Da co loi xay ra, vui long load lai page"
  ensure
    respond_to do |format|
      format.js
    end
  end

  def pending_booking
    @booking_tour.pending!
    flash[:success] = "Da thuc hien update thanh cong"
  rescue
    flash[:error] = "Da co loi xay ra, vui long load lai page"
  ensure
    respond_to do |format|
      format.js
    end
  end

  def show; end

  private

  def load_booking_tours
    @booking_tours = BookingTour.sort_by_start_date
      .paginate(page: params[:page], per_page: Settings.paginate.page_6)
    end

  def load_booking_tour
    @booking_tour = BookingTour.find_by id: params[:id]
    return if @booking_tour

    flash[:error] = "Da co loi xay ra, vui long load lai trang"
    redirect_to admin_booking_tours_path
  end
end
