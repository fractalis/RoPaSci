class Weapon < ActiveRecord::Base

  def calc_attack(level)
    return if self.nil?
    base_attack + (level * mod_attack)
  end
  
  def calc_defense(level)
    return if self.nil?
    base_defense + (level * mod_attack)
  end
  
  def self.perform_attack(player1, player2)
    weapon1 = Weapon.find_by_name(player1[:weapon_name])
    weapon2 = Weapon.find_by_name(player2[:weapon_name])

    p1_hp_loss = weapon1.calc_defense(player1[:weapon_level]) - weapon2.calc_attack(player2[:weapon_level])
    p2_hp_loss = weapon2.calc_defense(player2[:weapon_level]) - weapon1.calc_attack(player2[:weapon_level])

    {:p1_hp_loss => p1_hp_loss, :p2_hp_loss => p2_hp_loss}
  end

  def calc_hp_regen(level)
    return if self.nil?
    base_hp_regen + (level * mod_hp_regen)
  end
  
end
