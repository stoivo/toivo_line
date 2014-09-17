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
    rows.times do |row|
      columns.times do |column|
        GamePlot.create game_id: self.id, vertical: column, horizontal: row
      end
    end
  end

  def check_for_winner list
    seleced_hash = {}
    list.each do |plot|
      sele_by = plot.selected_by
      # return nil unless plot.class.to_s == "GamePlot"
      seleced_hash[sele_by.id] = 0 if seleced_hash[sele_by.id].nil?
      seleced_hash.map do |user_id, v| 
        # puts "userEY #{user}"
        # puts "VALUE #{v}"
        if user_id == sele_by.id
          seleced_hash[user_id] += 1
        else
          seleced_hash[user_id] = 0
        end
      puts seleced_hash.inspect
      end
    end
  end
end
