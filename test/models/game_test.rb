require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can not create a game without owner team or guest team or game_item or match_id or all" do 
    game = Game.new
    assert_not game.save
    assert_equal "Owner team must exist, Guest team must exist, Game item must exist, and Match must exist", game.errors.full_messages.to_sentence
    game_item = GameItem.first 
    assert game_item
    team_1 = TeamPlay.first 
    assert team_1 
    team_2 = TeamPlay.last 
    assert_includes TeamPlay.all, team_2
    game.owner_team_id = team_1.id 
    game.guest_team_id = team_2.id 
    game.game_item_id = game_item.id 
    assert game 
  end 

  test "can find out winner and loser" do 
    game = Game.first 
    assert game 
    puts game 
    game.owner_score = 2
    game.guest_score = 1 
    assert_equal game.winner, game.owner_team #it returns true when I test on rails c (code: game.winner == game.owner_team)
    assert_equal game.loser, game.guest_team  #it returns true when I test on rails c (code: game.loser == game.guest_team)
  end 
end

