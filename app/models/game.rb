class Game < ActiveRecord::Base

  def player_one
    player = Player.find_by_id(@player1_id)
    player unless player.nil?
  end

  def player_two
    player = Player.find_by_id(@player2_id)
    player unless player.nil?
  end

  def player_in_game?(id)
    nil unless player1_id == id or player2_id == id    
  end
end
