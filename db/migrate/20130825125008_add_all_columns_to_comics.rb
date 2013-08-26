class AddAllColumnsToComics < ActiveRecord::Migration
  def change
    add_column :comics, :year, :string
    add_column :comics, :format, :string
    add_column :comics, :pictures, :string
    add_column :comics, :language, :string
    add_column :comics, :size, :string
  end
end
