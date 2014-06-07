class CreateColorschemas < ActiveRecord::Migration
  def change
    create_table :colorschemas do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      
      t.timestamps
    end
  end
end
