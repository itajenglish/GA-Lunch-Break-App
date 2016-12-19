class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def create
    @place = params['place']
    Place.create(name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'])
    redirect_to(:back)
  end

  def destroy
    Place.destroy(params['id'])
    redirect_to(:back)
  end

  def show
    @place = Place.find_by(id: params[:id])
  end

  def update
    @place = params['place']
    Place.update(name: @place['name'],
                  address: @place['address'],
                  latitude: @place['latitude'],
                  longitude: @place['longitude'])
    redirect_to(:back)
  end

end
