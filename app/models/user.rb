class User < ActiveRecord::Base
  acts_as_authentic
  has_one :player

  # Creates the player, given the players name as their
  # login. Also initializes the players weapon, returning
  # nil in any case that updates fail.
  def create_player
    return if !player.nil?

    player = Player.new
    player.user_id = id
    player.player_name = login
    
    return nil if !player.save
    return nil if !player.create_weapons
    
    player
  end

end
