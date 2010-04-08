module ropasci

  class Scissor < Weapon
    
    @@attack_mod = 2
    @@defense_mod = 1
    
    def initialize
      @name = "Scissors"
      @base_attack = 3
      @base_defense = 2
    end
    
    def level_up
      @level += 1
      @base_attack += Scissor::attack_mod
      @base_defense += Scissor::defense_mod
    end
    
  end
end
