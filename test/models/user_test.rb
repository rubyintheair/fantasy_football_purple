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

  test "should not save without last name" do 
    a = User.new(first_name: "Quy")
    assert_not a.save 
    assert_equal "Last name can't be blank", a.errors.full_messages.to_sentence
  end 

  test "should not save without first name" do 
    a = User.new(last_name: "Nguyen")
    assert_not a.save 
    assert_equal "First name can't be blank", a.errors.full_messages.to_sentence
  end 

  # test "add_friend should add a user as a teammate" do 
  #   a = User.new(first_name: "111", last_name: "2345")
  #   assert a.save 
  #   b = User.new(first_name: "222", last_name: "2345")
  #   assert b.save
  #   a.add_teammate(b)
  #   assert_includes a.teammates, b 
  #   assert_equal 1, a.teammates.count
  # end 

  test "create successfully a TeamPlay from User model" do 
    a = User.first 
    b = User.last
    c = a.team_plays.new(teammate_id: b.id, name: "hahahaha")
    c.save
    assert c
    assert_equal "hahahaha", c.name
  end 

  test "an user can find his/her teammate" do 
    a = User.first 
    b = User.last 
    c = a.team_plays.new(teammate_id: b.id, name: "hahaha")
    assert c.save 
    assert_equal 1, a.teammates.count
    assert_equal a.teammates.first.first_name, b.first_name 
  end 



  



end
