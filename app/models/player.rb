class Player < ActiveRecord::Base
  belongs_to :user
  has_many :player_weapons, :foreign_key => "player_id"

  def total_games
    wins + losses + draws
  end

  def create_weapons
    return if self.id.nil?
    weapons = Weapon.find(:all)    
    weapons.each do |weapon|
      player_weapon = PlayerWeapon.new
      player_weapon.create_player_weapon({ :player_id => id,
                             :weapon_id => weapon.id,
                             :level => 1,
                             :times_played => 0})      
    end
  end

  def select_weapon(weapon_name)
    weapon = Weapon.find_by_name(weapon_name)
    pweapon = PlayerWeapon.find_by_weapon_id(weapon.id)

    pweapon.times_played += 1
    pweapon.save
  end

  def win_game
    return if self.id.nil?
    self.wins += 1
  end
  
  def draw_game
    return if self.id.nil?
    self.draws += 1
  end

  def lose_game
    return if self.id.nil?
    self.losses += 1
  end
end
