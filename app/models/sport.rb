class Sport < ActiveRecord::Base
	validates_presence_of :name
  validates_presence_of :players
  validates_presence_of :court
end
