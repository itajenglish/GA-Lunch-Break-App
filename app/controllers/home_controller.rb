class HomeController < ApplicationController
  def index
    @places = Place.all.reverse
    gon.places = Place.limit(20)
  end
end
