class User < ActiveRecord::Base

  has_many :games
  has_many :game_plots
  
  has_one :default_play_brick, :class_name => "PlayBrick", :foreign_key => "id", primary_key: "default_play_brick_id"
  # accepts_nested_attributes_for :default_play_brick, :allow_destroy => true
  has_many :added_play_bricks, :class_name => "PlayBrick", :foreign_key => "added_by_id", :dependent => :destroy
  accepts_nested_attributes_for :added_play_bricks, :allow_destroy => true


  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

  validates :username, :length => { :within => 3..26 },
                       :uniqueness => true
  validates :epost, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX,
                    :confirmation => true

  validate :username_is_allowed
  #validate :no_new_users_on_saturday, :on => :create

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use.")
    end
  end

  # Errors not related to a specific attribute
  # can be added to errors[:base]
  def no_new_users_on_saturday
    if Time.now.wday == 6
      errors[:base] << "No new users on Saturdays."
    end
  end

end
