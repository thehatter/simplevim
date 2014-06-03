class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
    	t.string :title
    	t.string :description
    	t.string :link

      t.timestamps
    end
  end
end
