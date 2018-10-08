class Enrollment < ApplicationRecord
  validates_associated :section, :student
  validates :section_id, :student_id, presence: true
  validates :section_id, uniqueness: { scope: :student_id, message: "already associated" }

  belongs_to :section
  belongs_to :student
end
