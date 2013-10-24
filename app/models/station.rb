class Station < ActiveRecord::Base
	attr_accessible :line_id, :group_id, :zipcode, :name, :address, :pref_cd, :lon, :lat, :display_flg,:sort
end
