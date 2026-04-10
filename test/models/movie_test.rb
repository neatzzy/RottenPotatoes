require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create!(title: "Test Movie")
    @genre = Genre.create!(name: "Drama")
  end

  test "can associate genres through movie_genres" do
    mg = MovieGenre.create!(movie: @movie, genre: @genre)
    assert_includes @movie.genres, @genre
    assert_equal @movie, mg.movie
    assert_equal @genre, mg.genre
  end
end
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
