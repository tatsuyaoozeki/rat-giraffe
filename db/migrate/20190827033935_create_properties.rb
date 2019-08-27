class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.integer :rent_price
      t.text :address
      t.integer :age
      t.text :remark

      t.timestamps
    end
  end
end
