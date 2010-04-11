class GamesController < ApplicationController

  before_filter :require_user
  before_filter :player_game?, :only => [:show]

  def index
    user = @current_user
    pid = user.player.id
    @games = Game.find(:all,:conditions => ["player1_id = ? or player2_id = ?",pid,pid])
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
      redirect_to :action => "play", :id => @game.id
    else
      flash[:notice] = "Could not start new game"
      render :action => :new
    end
  end
  
  def round

    @game = Game.find_by_id(params[:gameid])

    if @game.active
      @pweapon1 = PlayerWeapon.find_by_id(params[:pw1])
      @pweapon2 = PlayerWeapon.select_random_weapon(params[:compid])
      
      @game.perform_round(@pweapon1,@pweapon2)
      
      if @game.winner?
        @game.winner! # Update the winner
        @winner = Player.find_by_id(@game.winner) unless (@game.winner.nil? || @game.winner == 0)        
      else
        
      end
    end
  end

  def play
    @game = Game.find_by_id(params[:id])
    if !@game.active
      flash[:error] = "Game is no longer active"
      redirect_to account_url unless @game.active
    else
      @player1 = Player.find_by_id(@game.player1_id)
      @player2 = Player.find_by_id(@game.player2_id)
    end
  end

  def show
    @game = Game.find_by_id(params[:id])    
  end

  def destroy
  end

  private      
  def player_game?
    @game = Game.find_by_id(params[:id])   
    unless !@game.nil?
      render :text => "Access Denied", :status => 403
      return
    end    
    @game.player_in_game?(3)
  end

end
