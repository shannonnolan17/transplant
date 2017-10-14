class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :organization_id
      t.string :street_address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
