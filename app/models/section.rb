class Section < ApplicationRecord
  validates :number, :semester, :room_number, presence: true
  validates :number, numericality: { greater_than: 0 }
  validates :semester, inclusion: { in: %w(Fall Spring Summer) }
  validates_associated :course  
  validates :number, uniqueness: { scope: :course , message: " already exists for selected course" }

  belongs_to :course

  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  def name
    "#{course.name}-#{number}"
  end
end
