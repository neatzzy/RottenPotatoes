class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.date :release_date
      t.integer :duration_minutes
      t.string :poster_url

      t.timestamps
    end
  end
end
