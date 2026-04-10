require "test_helper"

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = Person.create!(name: "Director")
    @movie = Movie.create!(title: "Person Movie")
  end

  test "person has movies through roles" do
    Role.create!(person: @person, movie: @movie, role_type: "director")
    assert_includes @person.movies, @movie
  end
end
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
