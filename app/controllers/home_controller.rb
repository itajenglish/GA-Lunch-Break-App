class HomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to("/places")
    elsif session[:user_id] = nil
      redirect_to("/")
    end
    @places = Place.all.reverse
    gon.places = Place.limit(20)
  end
end