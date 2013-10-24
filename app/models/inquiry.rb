class Inquiry < ActiveRecord::Base
  belongs_to :from_user, class_name: "FromUser" ,foreign_key: "from_userid"
  belongs_to :to_user, class_name: "ToUser" ,foreign_key: "to_userid"
  #belongs_to :to_user, :class_name ='User', :foreign_key => :to_userid
  validates :to_userid ,presence: true
  validates :from_userid ,presence: true
  validates :subject ,presence: true
  validates :body ,presence: true
  attr_accessible :to_userid, :from_userid, :subject, :body, :sent_time, :deleted_time_by_sender, :deleted_time_by_recipient
end
