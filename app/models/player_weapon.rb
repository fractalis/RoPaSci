class PlayerWeapon < ActiveRecord::Base
  belongs_to :player
  belongs_to :weapon

  def create_player_weapon(params)
    self.player_id = params[:player_id]
    self.weapon_id = params[:weapon_id]
    self.level = params[:level]
    self.times_played = params[:times_played]
  end

  def level_weapon
    self.level += 1
    self.save
  end
end
