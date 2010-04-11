class Game < ActiveRecord::Base
  
  def self.rules(p1,p2)
    player1 = Player.find_by_id(p1[:player_id])
    player2 = Player.find_by_id(p2[:player_id])
    
    player1_wpn = PlayerWeapon.find_by_id(p1[:player_weapon_id])
    player2_wpn = PlayerWeapon.find_by_id(p2[:player_weapon_id])
    
    hp_loss = PlayerWeapon.perform_attack(player1_wpn,player2_wpn)
  end

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
