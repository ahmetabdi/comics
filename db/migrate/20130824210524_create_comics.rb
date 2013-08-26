class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.text :description
      t.text :tags
      t.text :category

      t.timestamps
    end
  end
end
