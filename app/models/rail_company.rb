class RailCompany < ActiveRecord::Base
	attr_accessible :rr_id, :name, :url, :company_type, :status, :sort
end
