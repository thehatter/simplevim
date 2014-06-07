class AddTagToHack < ActiveRecord::Migration
  def change
  	add_column :hacks, :tag, :string
  end
end
