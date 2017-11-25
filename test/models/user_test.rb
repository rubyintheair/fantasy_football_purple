require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create with first name and last name" do 
    a = User.create(first_name: "Quy", last_name: "Nguyen")
    assert a
  end 

  test "can set and save first name and last name" do 
    a = User.new(first_name: "Quy", last_name: "Nguyen")
    assert a.save
  end 

  test "can set first name and last name" do 
    a = User.new 
    a.first_name = "Quy"
    a.last_name = "Nguyen"
    assert_equal "Quy", a.first_name
    assert_equal "Nguyen", a.last_name
  end 

end
