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
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_path(@property.id), notice: '物件を登録しました' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_path(@property.id), notice: '編集しました' }
        format.json { render 'show', status: :ok, local: @property }
      else
        format.html { redirect_to 'edit'}
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      if @property.destroy
        format.html { redirect_to properties_url, notice: '削除しました' }
        format.json { head :no_content }
      end
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
