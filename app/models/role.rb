class Role < ApplicationRecord
  belongs_to :person
  belongs_to :movie
  enum :role_type, { actor: "Actor", director: "Director", producer: "Producer" }
end
