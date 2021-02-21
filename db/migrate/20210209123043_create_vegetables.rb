class CreateVegetables < ActiveRecord::Migration[6.0]
  def change
    create_table :vegetables do |t|
      t.string :category, null: false
      t.integer :price,    null: false
      t.references :user,  foreign_key: true
      t.references :stand, foreign_key: true
      t.integer :shipment_service_id, nul: false
      t.integer :delivery_fee_id
      t.string :quality_description
      t.string :amount, null: false
      t.text :important_notice
      t.text :message
      t.timestamps
    end
  end
end
