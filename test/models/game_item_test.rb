require 'test_helper'

class GameItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create with name and guidance" do 
    a = GameItem.create(name: "Test", guidance: "This is just a test")
    assert a
  end 

  test "can create with question" do 
    a = GameItem.create(name: "test", question: "Hihihi")
    assert a
  end 
end
