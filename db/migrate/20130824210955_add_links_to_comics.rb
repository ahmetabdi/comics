class AddLinksToComics < ActiveRecord::Migration
  def change
    add_column :comics, :link, :string
  end
end
