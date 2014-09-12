class Game < ActiveRecord::Base
  belongs_to :start_by, :class_name => "User"
  belongs_to :winner, :class_name => "User"
  belongs_to :losser, :class_name => "User"
  belongs_to :first_player, :class_name => "User"
  belongs_to :secound_player, :class_name => "User"
  has_many :plots, :class_name => "GamePlot"

  after_save :create_game_plots
  # belongs_to :subject
  # has_many :sections
  # has_and_belongs_to_many :editors, :class_name => "AdminUser"
  def create_game_plots
    1.upto(rows) do |row|
      1.upto(columns) do |column|
        GamePlot.create game_id: self.id, vertical: column, horizontal: row
      end
    end
  end
end

# Game.creat! start_by_id: u1, winner_id: u1, losser_id: u2, first_player_id: u1, secound_player_id: u2, weight: 3, height: 3
