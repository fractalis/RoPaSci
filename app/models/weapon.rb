class Weapon < ActiveRecord::Base
  
  def calc_attack(level)
    base_attack + (level * mod_attack)
  end
  
  def calc_defense(level)
    base_defense + (level * mod_attack)
  end
end
