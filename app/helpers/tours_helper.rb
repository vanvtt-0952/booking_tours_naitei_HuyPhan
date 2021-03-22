module ToursHelper
  def display_stars_layout tour
    points = tour.reviews.pluck :point
    average_point = points.sum(0)/points.size
    html_star_checked = ''

    (1..5).each do |index|
      checked = average_point >= index ? "fa-star checked" : "fa-star-o"
      html_star_checked << "<span class='fa #{checked}'></span>"
    end

    html_star_checked << "<span class='review-no ml-2'>(#{average_point} stars/ #{I18n.t "review", count: points.size})</span>"

    html_star_checked
  end
end
