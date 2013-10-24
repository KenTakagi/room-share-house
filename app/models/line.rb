class Line < ActiveRecord::Base
	attr_accessible :name, :sort, :company_id, :status
end
