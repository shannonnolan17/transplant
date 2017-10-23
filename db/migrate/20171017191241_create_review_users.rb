class CreateReviewUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :ReviewUsers do |t|
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
