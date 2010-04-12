class Game < ActiveRecord::Base
  
  # Queries to check if the given player id represents
  # a player in the game.
  def player_in_game?(id)
    nil unless player1_id == id or player2_id == id    
  end

  # Non-DB destructive function for subtracting hp for players
  def lose_hp(p1_hp_loss, p2_hp_loss)
    # Don't update HP if defense completely negated the attack
    self.player1_hp -= p1_hp_loss unless p1_hp_loss < 0
    self.player2_hp -= p2_hp_loss unless p2_hp_loss < 0
    self
  end

  # Updates DB automatically after HP loss.
  def lose_hp!(p1_hp_loss, p2_hp_loss)
    self.lose_hp(p1_hp_loss,p2_hp_loss).save
  end
  
  # Non-DB Destructive func for regaining HP
  def regen_hp(p1_hp_regen, p2_hp_regen)
    self.player1_hp += p1_hp_regen
    self.player2_hp += p2_hp_regen
    self
  end

  # Updates DB automatically after HP regen
  def regen_hp!(p1_hp_regen, p2_hp_regen)
    self.regen_hp(p1_hp_regen,p2_hp_regen).save
  end

  # Applies Player's weapons in a round, updating each
  # players HP as appropriate.
  def perform_round(pweapon1, pweapon2)    
    hp_loss = PlayerWeapon.perform_attack(pweapon1,pweapon2)
    hp_regen = PlayerWeapon.perform_hp_regen(pweapon1,pweapon2)

    self.lose_hp!(hp_loss[:p1_hp_loss], hp_loss[:p2_hp_loss])
    self.regen_hp!(hp_regen[:p1_hp_regen], hp_regen[:p2_hp_regen])

    self.next_round!    
  end

  # Updates the Winner
  def winner!
    return nil unless self.winner? || self.draw?
    
    if self.player1_hp <= 0
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

  def draw!
    Player.update_draw!(self.player1_id,self.player2_id)

    self.active = 0;
    self.save
  end
  
  def draw?
    self.player1_hp <= 0 && self.player2_hp <= 0
  end

  def next_round!
    self.round_num += 1
    self.save
  end
end
