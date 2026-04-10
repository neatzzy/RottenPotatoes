require "test_helper"

class MovieGenreTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create!(title: "MG Movie")
    @genre = Genre.create!(name: "Sci-Fi")
  end

  test "movie_genre belongs to movie and genre" do
    mg = MovieGenre.create!(movie: @movie, genre: @genre)
    assert_equal @movie, mg.movie
    assert_equal @genre, mg.genre
  end
end
require "test_helper"

class MovieGenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
