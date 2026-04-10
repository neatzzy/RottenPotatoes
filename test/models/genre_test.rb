require "test_helper"

class GenreTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create!(title: "G Test Movie")
    @genre = Genre.create!(name: "Comedy")
    @movie_genre = MovieGenre.create!(movie: @movie, genre: @genre)
  end

  test "genre has movies through movie_genres" do
    assert_includes @genre.movies, @movie
  end
end
require "test_helper"

class GenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
