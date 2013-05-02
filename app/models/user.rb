class User < ActiveRecord::Base
  attr_accessible :name, :uid
  has_many :victims
  has_many :debts, :through => :victims
   def self.create_user(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
