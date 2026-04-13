class AddAgeRatingToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :age_rating, :integer, default: 0, null: false
  end
end
