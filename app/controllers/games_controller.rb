class GamesController < ApplicationController
  def index 
    @game_items = GameItem.all 
  end 

  def update 
    @game = Game.find(params[:id])
    @match = @game.match 
    @game.answer = params[:answer]
    if @game.save 
      if @match.games.count < 4
        flash[:success] = "Choose next game"
        redirect_to new_game_path
      else
        flash[:success] = "Ohh! Congratulations!!! Your team have completed the Match"
        redirect_to root_path
      end 
    else 
      flash[:error] = "#{@game.errors.full_messages.to_sentence}"
      redirect_back 
    end 
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
    #  redirect_to game_item_path(:game_item_id => @game.game_item.id, :game_id => @game.id)
      redirect_to display_path(:game_item_id => @game.game_item.id, :game_id => @game.id)
    else 
      flash[:errors] = "#{@game.errors.full_messages.to_sentence}"
      redirect_to new_game_path
    end 
  end 


  def game_params
    params.require(:game).permit(:game_item_id)
  end 
end
