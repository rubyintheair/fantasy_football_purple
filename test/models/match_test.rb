require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can not create a match without owner_team and guest_team" do 
    a = Match.new 
    assert_not a.save 
    assert_equal "Owner team must exist and Guest team must exist", a.errors.full_messages.to_sentence
  end

  test "can create a match with owner_team and guest_team" do 
    a = User.create(first_name: "111", last_name: "2345")
    b = User.create(first_name: "222", last_name: "2345")
    c = User.create(first_name: "333", last_name: "2345")
    d = User.create(first_name: "444", last_name: "2345")
    team_1 = TeamPlay.create(name: "123", user: a, teammate: b)
    team_2 = TeamPlay.create(name: "34567", user: a, teammate: c)
    match = Match.new(owner_team: team_1, guest_team: team_2)
    assert a.save 
    assert_equal "111", match.owner_team.user.first_name
    assert_equal "34567", match.guest_team.name
  end  

end
