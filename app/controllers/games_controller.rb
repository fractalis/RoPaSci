class GamesController < ApplicationController

  before_filter :require_user
  before_filter :player_game?, :only => [:show]

  def index
    @games = Game.find(:all)
  end

  def new
    @game = Game.new
    @player = @current_user.player    
    @player2 = User.find_by_id(2).player   
  end

  def create
    @game = Game.new(params[:game])
    @game.active = true
    @game.round_num = 1
        
    if @game.save
      flash[:notice] = "Starting New Game"
      redirect_to game_url @game.id
    else
      flash[:notice] = "Could not start new game"
      render :action => :new
    end
  end

  def show
    @game = Game.find_by_id(params[:id])    
  end

  def destroy
  end

  private
  
  def player_game?
    # @user = @current_user
    @game = Game.find_by_id(params[:id])
    
    render :nothing, :status => 403 unless !@game.nil?
    @game.player_in_game?(3)
  end

end
