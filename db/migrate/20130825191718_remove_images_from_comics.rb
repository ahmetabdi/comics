class RemoveImagesFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :images, :string
    add_column :comics, :image, :string
  end
end
