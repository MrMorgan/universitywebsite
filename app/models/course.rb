class Course < ApplicationRecord
    validates :name, :department, :number, :credits, presence: true
    validates :credits, numericality: { greater_than_or_equal_to: 0 }

    has_many :sections, dependent: :destroy
end
