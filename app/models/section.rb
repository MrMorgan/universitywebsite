class Section < ApplicationRecord
  validates :number, :semester, presence: true
  belongs_to :course

  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  def name
    "#{course.name}-#{number}"
  end
end
