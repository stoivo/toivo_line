class User < ActiveRecord::Base

  has_many :games
  has_many :game_plots

  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']


  # shortcut validations, aka "sexy validations"
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
