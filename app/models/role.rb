class Role < ApplicationRecord
  belongs_to :person
  belongs_to :movie

  enum :role_type, { actor: "Actor", director: "Director", producer: "Producer" }

  attr_writer :person_name

  def person_name
    @person_name || person&.name
  end

  before_validation :assign_person_by_name

  private

  def assign_person_by_name
    if person_name.present?
      self.person = Person.find_or_create_by(name: person_name)
    end
  end
end
