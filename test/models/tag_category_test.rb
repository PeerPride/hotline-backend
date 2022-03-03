require "test_helper"

class TagCategoryTest < ActiveSupport::TestCase
  test "Tag Category requires a unique name" do
    tc1 = TagCategory.new
    tc1.name = 'Category'
    tc1.save!

    tc2 = TagCategory.new
    tc2.name = 'Category'
    assert_raises(ActiveRecord::RecordInvalid) do
      tc2.save!
    end
  end

  test "Tag Category requires a name" do
    tc1 = TagCategory.new
    assert_raises(ActiveRecord::RecordInvalid) do
      tc1.save!
    end
  end
end
