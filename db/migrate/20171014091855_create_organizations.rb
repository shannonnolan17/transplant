class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :rating
      t.string :image_url
      t.string :term

      t.timestamps
    end
  end
end
