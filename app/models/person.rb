class Person < ApplicationRecord
    has_many :roles, dependent: :destroy
    has_many :movies, through: :roles
end
