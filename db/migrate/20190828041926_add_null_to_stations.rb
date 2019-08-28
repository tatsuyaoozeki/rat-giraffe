class AddNullToStations < ActiveRecord::Migration[5.0]
  def change
    change_column_null :stations, :route_name, false
    change_column_null :stations, :station_name, false
    change_column_null :stations, :time_required, false
  end
end
