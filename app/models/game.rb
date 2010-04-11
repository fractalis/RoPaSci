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

  def lose_hp(p1_hp_loss, p2_hp_loss)
    self.player1_hp -= p1_hp_loss
    self.player2_hp -= p2_hp_loss
    self
  end

  def lose_hp!(p1_hp_loss, p2_hp_loss)
    self.lose_hp(p1_hp_loss,p2_hp_loss).save
  end
  
  def regen_hp(p1_hp_regen, p2_hp_regen)
    self.player1_hp += p1_hp_regen
    self.player2_hp += p2_hp_regen
    self
  end

  def regen_hp!(p1_hp_regen, p2_hp_regen)
    self.regen_hp(p1_hp_regen,p2_hp_regen).save
  end

  def perform_round(pweapon1, pweapon2)    
    hp_loss = PlayerWeapon.perform_attack(pweapon1,pweapon2)
    hp_regen = PlayerWeapon.perform_hp_regen(pweapon1,pweapon2)

    self.lose_hp!(hp_loss[:p1_hp_loss], hp_loss[:p2_hp_loss])
    self.regen_hp!(hp_regen[:p1_hp_regen], hp_regen[:p2_hp_regen])

    self.next_round!    
  end

  # Updates the Winner
  def winner!
    return nil unless self.winner?
    
    if self.draw?
      self.winner = 0
    elsif self.player1_hp <= 0
      self.winner = self.player2_id
      Player.update_stats!(self.winner,self.player1_id)
    else
      self.winner = self.player1_id
      Player.update_stats!(self.winner,self.player2_id)
    end

    self.active = 0;
    self.save && self.winner    
  end

  def winner?
     self.player1_hp <= 0 || self.player2_hp <= 0      
  end    
  
  def draw?
    self.player1_hp <= 0 && self.player2_hp <= 0
  end

  def next_round!
    self.round_num += 1
    self.save
  end
end
