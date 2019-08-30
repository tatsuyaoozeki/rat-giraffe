class PropertiesController < ApplicationController
  before_action :set_property, only: [ :show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times {@property.stations.build}
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: '物件を登録しました'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property.id), notice: '編集しました'
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @property.destroy
    if @property.destroy
      redirect_to properties_url, notice: '削除しました'
    end
  end

  private

    def property_params
      params.require(:property).permit(:property_name, :rent_price, :address, :age, :remark, stations_attributes: [:id, :route_name, :station_name, :time_required])
    end

    def set_property
      @property = Property.find(params[:id])
    end
end
