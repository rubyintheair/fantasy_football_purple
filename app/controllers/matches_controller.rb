class MatchesController < ApplicationController
  def index 
  end 

  def new 
    @owner_teams = TeamPlay.where(user_id: current_user.id)
    @guest_teams = TeamPlay.where("user_id != ? AND teammate_id != ?", current_user.id, current_user.id)
  end 

  def create 
    @match = Match.new(match_params)
    @match.user_id = current_user.id 
    if @match.save 
      flash[:success] = "Create match successfully"
      redirect_to matches_path
    else 
      flash[:error] = "#{@match.errors.full_messages.to_sentence}"
      redirect_to new_match_path
    end 
  end 

  def match_params
    params.require(:match).permit(:owner_team_id, :guest_team_id)
  end 

end
