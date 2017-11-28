require 'test_helper'

class TeamPlayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have name, user and teammate" do 
    a = TeamPlay.new 
    assert_not a.save
    assert_equal "Name can't be blank, User must exist, and Teammate must exist", a.errors.full_messages.to_sentence
  end 

  test "create successfully a TeamPlay from TeamPlay model" do 
    a = TeamPlay.new(name: "123", user_id: User.first.id, teammate_id: User.last.id)
    assert a.save 
    assert_equal "123", TeamPlay.last.name
    assert_includes TeamPlay.all, a 
  end 
end
