class Participant < ActiveRecord::Base
  # has_many :chatrooms
  belongs_to :user
end
