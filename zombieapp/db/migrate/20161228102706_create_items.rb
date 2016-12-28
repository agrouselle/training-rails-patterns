class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.timestamp :published_on
      t.references :user
      t.timestamps null: false
    end
  end
end
