class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
