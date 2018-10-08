class Course < ApplicationRecord
    validates :name, :department, :number, :credits, presence: true
    validates :credits, numericality: { greater_than_or_equal_to: 0 }
    validates :number, uniqueness: { scope: :department, message: "already exists within department" }
    validates :name, uniqueness: true

    has_many :sections, dependent: :destroy
end
