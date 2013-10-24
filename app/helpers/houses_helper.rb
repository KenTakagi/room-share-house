module HousesHelper
  def get_house_kind_string(val)
    case val
    when 1 then
      "一戸建て"
    when 2 then
      "マンション"
    when 3 then
      "アパート"
    when 4 then
      "シェアハウス"
    else
    end
  end
end
