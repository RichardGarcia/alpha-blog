require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "CATEGORY should be VALID" do
    assert  @category.valid?
  end

  test "NAME should be PRESENT" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "NAME should be UNIQUE" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "NAME should not be too LONG" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "NAME should not be too SHORT" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end