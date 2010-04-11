class PlayerWeapon < ActiveRecord::Base
  belongs_to :player
  belongs_to :weapon

  def create_player_weapon(params)
    self.player_id = params[:player_id]
    self.weapon_id = params[:weapon_id]
    self.level = params[:level]
    self.times_played = params[:times_played]
  end

  def self.perform_attack(weapon1,weapon2)
    p1_hp_loss = weapon2.weapon.calc_attack(weapon2.level) - weapon1.weapon.calc_defense(weapon1.level)   
    p2_hp_loss = weapon1.weapon.calc_attack(weapon1.level) - weapon2.weapon.calc_defense(weapon2.level)

    weapon1.times_played += 1
    weapon2.times_played += 1

    weapon1.save
    weapon2.save
  
    {:p1_hp_loss => p1_hp_loss, :p2_hp_loss => p2_hp_loss}
  end

  def self.perform_hp_regen(weapon1,weapon2)
    { :p1_hp_regen => weapon1.weapon.calc_hp_regen(weapon1.level),
      :p2_hp_regen => p2_hp_regen = weapon2.weapon.calc_hp_regen(weapon2.level)}
  end

  # Selects a Random weapon given the player_id
  def self.select_random_weapon(player_id)
    player_wpns = self.find_all_by_player_id(player_id).map(&:id)
    
    return nil unless player_wpns.count > 0

    rnd_index = rand(player_wpns.count)
    self.find_by_id(player_wpns[rnd_index])
  end
    

  def level_weapon
    self.level += 1
    self.save
  end

end
