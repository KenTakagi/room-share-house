module ApplicationHelper
	def facility_check(array,key)
		if array.nil? || key.nil? then
			return ""
		else
			if array.include?(key) then
				return "checked"
			end
		end
	end
  def facility_display(array, select_list)
    str = ""
    array.each do |key,value|
      if select_list.include?(key) then
        str << value 
        str <<  ", "
      end
    end
    return str
  end
end
