require 'test_helper'

class GameItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create with name and guidance" do 
    a = GameItem.create(name: "Test", guidance: "This is just a test", question: "Hahahah")
    assert a
  end 

  test "can create with question" do 
    a = GameItem.create(name: "test", question: "Hihihi")
    assert a
  end 

  test "should not save without question" do 
    a = GameItem.new(name: "test")
    assert_not a.save
    assert_equal "Question can't be blank and Question has already been taken", a.errors.full_messages.to_sentence
  end 

  test "should not save with the same question" do 
    a = GameItem.new(name: "test", question: "how")
    assert a.save 
    b = GameItem.new(name: "hihi", question: "how")
    b.save 
    assert_equal "Question has already been taken", b.errors.full_messages.to_sentence
  end 
end
