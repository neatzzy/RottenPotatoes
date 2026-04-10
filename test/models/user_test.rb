require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(username: "u1", email: "u1@example.com", password_digest: "x")
    @movie = Movie.create!(title: "User Movie")
  end

  test "user has reviews" do
    review = Review.create!(user: @user, movie: @movie, rating: 5)
    assert_includes @user.reviews, review
  end
end
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
