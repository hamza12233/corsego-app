class HomeController < ApplicationController
  def index
    @courses = Course.all.limit(3)
  end
end
