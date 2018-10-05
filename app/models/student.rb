class Student < ApplicationRecord
    validates :name, presence: true

    has_many :enrollments, dependent: :destroy
    has_many :sections, through: :enrollments
end
