class Weapon < ActiveRecord::Base
  validates_presence_of :base_attack, :base_defense
  validates_presence_of :mod_attack, :mod_defense
  validates_presence_of :base_hp_regen, :mod_hp_regen
  
  # Calculates total attack based on player's weapon level.
  def calc_attack(level)
    return if self.nil?
    base_attack + (level * mod_attack)
  end
  
  # Calculates total defense based on player's weapon level.
  def calc_defense(level)
    return if self.nil?
    base_defense + (level * mod_attack)
  end

  # Calculates total hp regen based on player's weapon level.
  def calc_hp_regen(level)
    return if self.nil?
    base_hp_regen + (level * mod_hp_regen)
  end
  
end
