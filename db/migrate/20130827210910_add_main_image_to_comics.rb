class AddMainImageToComics < ActiveRecord::Migration
  def change
    add_column :comics, :main_image, :string
  end
end
