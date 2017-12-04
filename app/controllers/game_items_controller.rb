class GameItemsController < ApplicationController
  def index 
    @game_items = GameItem.all 
  end 

  def show
    @game_item = GameItem.find(params[:id])
  end 

  def new 
  end 

  def create 
    @game_item = GameItem.new(game_item_params)
    if @game_item.save 
      flash[:success] = "Game Item is created."
      redirect_to game_items_path
    else 
      flash[:error] = "#{@game_item.errors.full_messages.to_sentence}"
      redirect_to new_game_item_path
    end 
  end 

  def game_item_params
    params.require(:game_item).permit(:name, :question)
  end 

end
