class AddImagesToComics < ActiveRecord::Migration
  def change
    add_column :comics, :images, :string
  end
end
