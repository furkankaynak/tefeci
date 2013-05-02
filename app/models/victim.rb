class Victim < ActiveRecord::Base
  attr_accessible :facebook_username, :fullname, :twitter_username, :user_id
  has_many :debts
  belongs_to :user
end
