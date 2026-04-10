class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :synopsis
      t.date :release_date
      t.integer :duration
      t.timestamps
    end
  end
end
