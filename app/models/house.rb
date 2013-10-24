class House < ActiveRecord::Base
  has_many :rooms
	validates :name ,presence: :true, length:{maximum:20}
	validates :capacity ,presence: :true
	validates :prefecture ,presence: :true
	validates :city ,presence: :true
	validates :from_station ,presence: :true
	validates :kind ,presence: :true
	validates :note ,presence: :true

	attr_accessible :photo1,:photo2,:name,:capacity,:owner_id,:note,
		:prefecture,:city,:town,:from_station,:near_station_cd,:kind,:facility
	has_attached_file :photo1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
	has_attached_file :photo2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
end
