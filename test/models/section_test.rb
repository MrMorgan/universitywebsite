require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "cannot create empty section" do
     section = Section.new
     assert section.invalid?
     assert section.errors[:number].any?
     assert section.errors[:semester].any?
     assert section.errors[:course].any?
     assert section.errors[:room_number].any?
  end

  test "successully create section" do
    section = Section.new( number: 2,
                           semester: "Fall",
                           course: courses(:web),
                           room_number: 200)
    assert section.valid?
  end

  test "cannot create duplicate section" do
    duplicate = Section.new(number: 1,
                            semester: "Fall",
                            course: sections(:one).course,
                            room_number: 100)
    assert duplicate.invalid?
    assert_equal [" already exists for selected course"], duplicate.errors[:number]
  end
     
end
