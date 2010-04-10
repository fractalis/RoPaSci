class PlayerWeapon < ActiveRecord::Base
  belongs_to :players;
  belongs_to :weapons;
end
