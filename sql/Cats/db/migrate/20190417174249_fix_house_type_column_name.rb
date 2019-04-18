class FixHouseTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :houses, :type, :house_type
  end
end
