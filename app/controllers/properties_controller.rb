class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @station = Station.new
  end

  def create
    @property = Property.new(property_params)
    @station = Station.new(station_params)
    if @property.save && @station.save
      redirect_to property_path
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
  end

  private
    def property_params
      params.require(:property).permit(:property_name, :rent_price, :address, :age, :remark)
    end

    def station_params
      params.require(:station).permit(:route_name, :station_name, :time_required)
    end

    def set_property
      @property = Property.find(params[:id])
    end
end
