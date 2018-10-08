require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "cannot create student with no attributes" do
    student = Student.new()
    assert student.invalid?
  end

  test "cannot change name to nothing" do
    student = Student.new(name: "Steve")
    student.name = ""
    assert student.invalid?
    assert_equal ["can't be blank"],student.errors[:name]
  end  
end
