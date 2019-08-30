class AddNullToProperties < ActiveRecord::Migration[5.0]
  def change
    change_column_null :properties, :property_name, false
    change_column_null :properties, :rent_price, false
    change_column_null :properties, :address, false
    change_column_null :properties, :age, false
    change_column_null :properties, :remark, false
  end
end
