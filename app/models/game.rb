class Game < ActiveRecord::Base
  belongs_to :start_by, :class_name => "User"
  belongs_to :winner, :class_name => "User"
  belongs_to :losser, :class_name => "User"
  belongs_to :first_player, :class_name => "User"
  belongs_to :secound_player, :class_name => "User"

  # belongs_to :subject
  # has_many :sections
  # has_and_belongs_to_many :editors, :class_name => "AdminUser"

end
