module RoomsHelper
  def get_room_sex_string(kind)
    case kind
    when 1 then
      "男性のみ"
    when 2 then
      "女性のみ"
    when 3 then
      "どちらでも"
    else
      ""
    end
  end
  def get_room_kind_string(kind)
    case kind
    when 1 then
      "１人個室"
    when 2 then
      "二人ドミトリー"
    when 3 then
      "その他"
    else
      ""
    end
  end
  def get_room_nationality_string(nationality)
    case nationality
    when 1 then
      "日本人のみ"
    when 2 then
      "外国人OK！"
    else
      ""
    end
  end
  def get_room_enable_string(enable)
    case enable
    when true then
      "募集中"
    else
      "停止中"
    end
  end
end
