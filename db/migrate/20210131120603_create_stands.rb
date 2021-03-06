class CreateStands < ActiveRecord::Migration[6.0]
  def change
    create_table :stands do |t|
      t.string :street_address, null: false
      t.string :name
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
