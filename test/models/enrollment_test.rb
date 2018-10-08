require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "cannot make empty enrollment" do
    enrollment = Enrollment.new
    assert enrollment.invalid?
    assert enrollment.errors[:section].any?
    assert enrollment.errors[:student].any?
  end

  test "can create new enrollment" do
     enrollment = Enrollment.new( section: enrollments(:one).section,
                                  student: enrollments(:two).student)
    assert enrollment.valid?
  end

  test "cannot create duplicate enrollemnt" do
    enrollment = Enrollment.new( section: enrollments(:one).section,
                                 student: enrollments(:one).student)
    assert enrollment.invalid?
  end
end
