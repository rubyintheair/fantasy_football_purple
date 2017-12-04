class GamesController < ApplicationController
  def index 
    @game_items = GameItem.all 
  end 

  def new 
    @game_items = GameItem.all 
    @match = Match.where(user_id: current_user.id).last
  end 

  def create 
    @match = Match.where(user_id: current_user.id).last
    @game = @match.games.new(game_params)
    @game.owner_team = @match.owner_team
    @game.guest_team = @match.guest_team
    if @game.save 
      flash[:success] = "Enjoy game"
      redirect_to game_item_path(@game.game_item.id)
    else 
      flash[:errors] = "#{@game.errors.full_messages.to_sentence}"
      redirect_to new_game_path
    end 
  end 


  def game_params
    params.require(:game).permit(:game_item_id)
  end 
end
