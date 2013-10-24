class User < ActiveRecord::Base
  has_many :boards
	module Roles
		ADMIN="admin"
		REGISTER = "register"
		VIEWER = "viewer"
	end
	attr_accessible :provider, :uid, :name, :role, :email

	validates :provider, presence: :true
	validates :uid, presence: :true
	validates :name, presence: :true
	
	validates_uniqueness_of :uid, scope: :provider

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
		
			if user.provider != "twitter"
				user.name = auth["info"]["name"]
			else
				user.name = auth["info"]["nickname"]
			end
			user.role = User::Roles::REGISTER
		end
	end
end
