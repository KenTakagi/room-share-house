class Room < ActiveRecord::Base
  belongs_to :house
  validates :name ,presence: true,length:{maximum:20}
  validates :largeness ,presence: true,length:{maximum:10}
  validates :kind ,presence: true
  validates :sex ,presence: true
  validates :rent ,presence: true
  validates :expense ,presence: true
  validates :deposit ,presence: true
  validates :note ,presence: true
  validates :enable ,presence: true
  validates :nationality ,presence: true
	attr_accessible :photo1,:photo2, :house_id, :name, :largeness, :kind, :facilities, :sex, :rent, :expense, :note, :enable, :nationality, :deposit
	has_attached_file :photo1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
	has_attached_file :photo2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
end
