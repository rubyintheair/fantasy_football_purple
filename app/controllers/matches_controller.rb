class MatchesController < ApplicationController
  def index 
  end 

  def result 
    @match = Match.find(params[:match_id])
    @owner_score = @match.games.map {|e| e.owner_score}.sum 
    @guest_score = @match.games.map {|e| e.guest_score}.sum 
  end 

  def new 
    @owner_teams = TeamPlay.where(user_id: current_user.id)
    @guest_teams = TeamPlay.where("user_id != ? AND teammate_id != ?", current_user.id, current_user.id)
  end 

  def create 
    @match = Match.new(match_params)
    @match.user_id = current_user.id 
    if @match.save 
      flash[:success] = "Choose game! You have 3 turns in a match!"
      redirect_to new_game_path
    else 
      flash[:error] = "#{@match.errors.full_messages.to_sentence}"
      redirect_to new_match_path
    end 
  end 

  def match_params
    params.require(:match).permit(:owner_team_id, :guest_team_id)
  end 

end
