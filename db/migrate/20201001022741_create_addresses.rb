class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code       , null: false
      t.integer :prefecture_id    , null: false
      t.string :city              , null: false
      t.string :address           , null: false
      t.string :building
      t.string :phone_num         , null: false, unique: true
      t.references :order         , null: false, foreidn_key: true
      t.timestamps
    end
  end
end
