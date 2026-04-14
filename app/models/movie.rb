class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy

    has_many :movie_genres, dependent: :destroy
    has_many :genres, through: :movie_genres

    has_many :roles, dependent: :destroy
    has_many :people, through: :roles

    enum :age_rating, { G: 0, PG: 1, PG_13: 2, R: 3, NC_17: 4 }
    accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
end
