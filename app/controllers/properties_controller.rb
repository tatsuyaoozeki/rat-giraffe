class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @station = @property.stations.build
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to property_path(@property.id), notice: '物件を登録しました'
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
      params.require(:property).permit(:property_name, :rent_price, :address, :age, :remark, stations_attributes: [:route_name, :station_name, :time_required])
    end


    def set_property
      @property = Property.find(params[:id])
    end
end
