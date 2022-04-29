class RenameBuildeingColumnToDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :buildeing, :building
  end
end
