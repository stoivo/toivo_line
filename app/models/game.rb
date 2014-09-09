class Game < ActiveRecord::Base
  belongs_to :start_by, :class_name => "User"
  belongs_to :winner, :class_name => "User"
  belongs_to :losser, :class_name => "User"
  belongs_to :first_player, :class_name => "User"
  belongs_to :secound_player, :class_name => "User"
  has_many :gameploys

  # belongs_to :subject
  # has_many :sections
  # has_and_belongs_to_many :editors, :class_name => "AdminUser"

end

# Game.creat! start_by_id: u1, winner_id: u1, losser_id: u2, first_player_id: u1, secound_player_id: u2, weight: 3, height: 3
