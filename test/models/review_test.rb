require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(username: "tester", email: "t@example.com", password_digest: "x")
    @movie = Movie.create!(title: "Review Movie")
  end

  test "review belongs to user and movie" do
    review = Review.create!(user: @user, movie: @movie, rating: 4, body: "Nice")
    assert_equal @user, review.user
    assert_equal @movie, review.movie
    assert_includes @user.reviews, review
    assert_includes @movie.reviews, review
  end
end
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
