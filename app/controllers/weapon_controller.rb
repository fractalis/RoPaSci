class WeaponController < ApplicationController
  def index
    @weapons = Weapon.find(:all)
  end

end
