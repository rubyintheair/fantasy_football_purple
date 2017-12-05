class GamesController < ApplicationController
  def index 
    @game_items = GameItem.all 
  end 

  def update 
    @game = Game.find(params[:id])
    @match = @game.match 
    @game.answer = params[:game][:answer].split('=>').last.to_i
    if @game.answer.to_i == 3
      @game.owner_score += 1
    end 
    if @game.save 
      if @match.games.count < 3
        flash[:success] = "Next round! Choose game! Your team's score: #{@game.owner_score}"
        redirect_to new_game_path
      else
        flash[:success] = "Ohh! Congratulations!!! You completed the Match"
        redirect_to result_path(:match_id => @match.id)
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
    @game.owner_score = 0 
    @game.guest_score = 0.5
    if @game.save 
      if @match.games.count == 1
        flash[:success] = "Complete your first round!"
      elsif @match.games.count == 2
        flash[:success] = "Your second round!"
      else 
        flash[:success] = "Your final round!"
      end 
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
