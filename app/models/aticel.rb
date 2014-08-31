class Aticel < ActiveRecord::Base
  scope :sorted, -> {order(:name)}
end
