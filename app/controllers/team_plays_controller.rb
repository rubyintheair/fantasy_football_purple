class TeamPlaysController < ApplicationController
  def index 
    @teams = TeamPlay.all 
  end 

  def new 
  end 
  
  def create 
    my_team = current_user.team_plays.new(teamplays_params)
    if my_team.save
      flash[:success] = "Create team successfully"
    else 
      flash[:error] = "#{my_team.errors.full_messages.to_sentence}"
    end 
    redirect_to users_path
  end 

  private
  def teamplays_params
    params.require(:team_play).permit(:teammate_id, :name)
  end 
end
