class Movie < ApplicationRecord
    has_many :movie_genres, dependent: :destroy
    has_many :genres, through: :movie_genres
    has_many :reviews, dependent: :destroy
    has_many :roles, dependent: :destroy
    has_many :people, through: :roles

    def average_rating
        return nil if reviews.empty?
        reviews.average(:rating).to_f
    end

end
