class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.text   :description
      t.string :link
      t.string :year
      t.string :format
      t.string :pictures
      t.string :language
      t.string :size
      t.string :tags, array: true, default: []
      t.string :category, array: true, default: []
      t.string :images, array: true, default: []

      t.timestamps
    end
  end
end
