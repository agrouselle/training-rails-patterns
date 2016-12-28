class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :approved
      t.references :item
      t.timestamps null: false
    end
  end
end
