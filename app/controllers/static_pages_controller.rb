class StaticPagesController < ApplicationController
  before_action :load_tours, only: :home

  def home; end
end
