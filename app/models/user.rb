class User < ActiveRecord::Base
  acts_as_authentic
  has_one :player

  def create_player
    return if !player.nil?

    player = Player.new
    player.user_id = id
    player.player_name = login
    player.save
  end

end
