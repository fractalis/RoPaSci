module ropasci

  class Weapon
    attr_accessors :name, :base_attack, :base_defense, :modifiers, :level
    
    def initialize
      @name = "Weapon"
      @base_attack = 0
      @base_defense = 0
      @modifiers = []
    end
    
    def add_modifier(modifier)
      @modifiers.push(modifier)
    end
    
    def level_up
    end
    
  end
end
