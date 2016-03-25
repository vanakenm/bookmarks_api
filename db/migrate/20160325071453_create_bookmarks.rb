class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.string :url

      t.timestamps null: false
    end
  end
end
