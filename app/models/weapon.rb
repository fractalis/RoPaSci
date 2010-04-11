class Weapon < ActiveRecord::Base

  def calc_attack(level)
    return if self.nil?
    base_attack + (level * mod_attack)
  end
  
  def calc_defense(level)
    return if self.nil?
    base_defense + (level * mod_attack)
  end

  def calc_hp_regen(level)
    return if self.nil?
    base_hp_regen + (level * mod_hp_regen)
  end
  
end
