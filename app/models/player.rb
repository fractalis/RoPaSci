class Player < ActiveRecord::Base
  belongs_to :user
  has_many :player_weapons, :foreign_key => "player_id"

  def total_games
    wins + losses + draws
  end
end
