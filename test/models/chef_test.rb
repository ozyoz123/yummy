require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "ozy", email: "ozy1@ozy.com")
  end

  test "should be valid" do
    assert @chef.valid?
  end

  test "name should be pressent" do
  @chef.chefname = ""
  assert_not @chef.valid?
  end
  test "name should be less then 30 charactors" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email should not be to long" do
    @chef.email = "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end

  test "email should accept correct format" do
    valid_emails = %w[user@example.com Abdi@gmail.com Muse@yahoo.com ali@amaano.com]
    valid_emails.each  do |valids|
        @chef.email = valids
    assert @chef.valid?, #{valids.inspect} "should be valid"
    end
  end

  test"should reject invalid adresses" do
    invalid_emails = %w[abdi@example, ozy@example,com, jay@exampl.name., jay@bar+foo.com]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalid.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicable_chef = @chef.dup
    duplicable_chef.email = @chef.email.uppcase
    @chef.save
    assert_not duplicable_chef.valid?
  end

  test "email should be lower case be hitting db" do
    mixed_email = "josH@example.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
   end
end
