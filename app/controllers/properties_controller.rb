class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @station = Station.new
  end

  def create
    @property = Property.new(property_params)
    @station = Station.new()
    if @property.save && @station.save
      redirect_to property_path
    else
      render 'new'
    end
  end

  private
    def property_params
      params.require(:property).permit(:property_name, :rent_price, :address, :age, :remark)
    end

    def station_params
      params.require(:station).permit(:route_name, :station_name, :time_required)
    end
end
