class PlacesController < ApplicationController
skip_before_filter  :verify_authenticity_token
# this code allowed me to skip an error that said, "Can't verify CSRF token authenticity."
before_filter :authorize

  def index
    @places = Place.where(user_id: session[:user_id])
  end

  def create
    @place = params['place']
    Place.create(name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'],
                  user_id: session[:user_id])
    redirect_to("/places")
  end

  def edit
    @place = Place.find(params[:id])
  end

  def destroy
    Place.destroy(params['id'])
    redirect_to(:back)
  end

  def show
    @place = Place.find_by(id: params[:id])
    @comment  = Comment.where(place_id: params[:id])
  end

  def update
    @place = params['place']
    Place.update( params[:id],
                  name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'],
                  user_id: 1)

    redirect_to("/places")
  end

  # def place_params
  #   params(:place).permit(:name, :address, :latitude, :longitude)
  # end

end
