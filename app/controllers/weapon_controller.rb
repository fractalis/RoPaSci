class WeaponController < ApplicationController
  before_filter :require_user

  def index
    @weapons = Weapon.find(:all)
  end

  def select
    user = @current_user
    @player_weapons = user.player.player_weapons
  end
    

end
