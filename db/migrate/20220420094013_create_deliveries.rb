class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string      :post_address,     null: false
      t.integer     :source_id,        null: false
      t.string      :municipality,     null: false
      t.string      :address,          null: false
      t.string      :buildeing
      t.string      :phone_number,     null: false
      t.references  :purchase,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
