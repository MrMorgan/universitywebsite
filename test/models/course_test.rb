require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "course cannot be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:name].any?
    assert course.errors[:department].any?
    assert course.errors[:number].any?
    assert course.errors[:credits].any?
  end

  test "credits must be positive" do
    course = Course.new( name: "test course",
                         department: "none",
                         number: "3000",
                         credits: 4 )
    assert course.valid?
    course.credits = -1
    assert course.invalid?
    assert_equal ["must be greater than or equal to 0"], course.errors[:credits]
  end

  test "cannot have duplicate course number" do
  course = Course.new( name: "Web",
                       department: "Computer Science",
                       number: "390p",
                       credits: "4")
  assert course.invalid?
  assert_equal ["already exists within department"], course.errors[:number]
  end

  test "name must be unique" do
  course = Course.new( name: "Web Apps",
                       department: "CIS",
                       number: "300",
                       credits: 2
                       )
  assert course.invalid?
  assert_equal ["has already been taken"], course.errors[:name]
  end
end
