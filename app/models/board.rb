class Board < ActiveRecord::Base
  belongs_to :user
  validates :kind ,presence: true
  validates :subject ,presence: true, length:{maximum:100}
  validates :body ,presence: true
  validates :prefecture ,presence: true
  validates :city ,presence: true
  #validates :sex ,presence: true

  attr_accessible :user_id, :kind, :subject, :body, :prefecture, :city, :town, :sex, :deleted_at
end
