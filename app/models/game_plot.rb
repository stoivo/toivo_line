class GamePlot < ActiveRecord::Base
  belongs_to :game
  belongs_to :selected_by, :class_name => "User"
end
