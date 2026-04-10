require "test_helper"

class RoleTest < ActiveSupport::TestCase
  def setup
    @person = Person.create!(name: "Actor")
    @movie = Movie.create!(title: "Role Movie")
  end

  test "role belongs to person and movie" do
    role = Role.create!(person: @person, movie: @movie, role_type: "actor", character_name: "Hero")
    assert_equal @person, role.person
    assert_equal @movie, role.movie
    assert_includes @person.roles, role
    assert_includes @movie.roles, role
  end
end
require "test_helper"

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
