class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.boolean :is_approved
      t.references :user
      t.timestamps null: false
    end
  end
end
