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
  
    {:p1_hp_loss => p1_hp_loss, :p2_hp_loss => p2_hp_loss}
  end

  def level_weapon
    self.level += 1
    self.save
  end
end
