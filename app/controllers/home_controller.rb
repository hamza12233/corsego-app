class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @courses = Course.all.limit(3)
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end
end
