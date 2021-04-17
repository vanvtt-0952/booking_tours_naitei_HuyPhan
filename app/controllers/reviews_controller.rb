class ReviewsController < ApplicationController
  before_action :logged_in_user
  before_action :load_tour, only: %i(new create)

  def new
    @review = @tour.reviews.new
  end

  def create
    @review = @tour.reviews.new review_params
    if @review.save
      flash[:info] = "Tao review thanh cong"
    else
      flash[:error] = "Da co loi, tao review that bai"
    end

    redirect_to tours_path
  end

  def index
    @reviews = Review.view.sort_by_created_at.paginate(page: params[:reviews], per_page: Settings.paginate.page_8)

    @my_reviews = current_user.reviews.sort_by_created_at.paginate(page: params[:my_reviews], per_page: Settings.paginate.page_6)
  end

  private

  def review_params
    params.require(:review)
      .permit(:content, :point)
      .merge(user_id: current_user.id)
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour

    flash[:warning] = "Da co loi xay ra, vui long load lai page"
    redirect_to tours_path
  end

  def load_review
    @review = Review.find_by id: params[:id]
    return if @review

    flash[:error] = "Da co loi xay ra, vui long load lai trang"
    redirect_to booking_tours_path
  end

  def load_reviews
    @reviews = @current_user.reviews
      .sort_by_update_at
      .paginate(page: params[:page], per_page: Settings.paginate.page_6)
  end
end
