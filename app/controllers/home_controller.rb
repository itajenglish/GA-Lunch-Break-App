class HomeController < ApplicationController
  def index
    @places = Place.all
  end
end
