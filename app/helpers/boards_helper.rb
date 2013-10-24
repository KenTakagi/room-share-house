module BoardsHelper
  @@kind = {1=> '駐車場貸します',
           2=> '駐車場借りたい',
           3=> '不用品あります',
           4=> '不用品ください',
           5=> '仕事あります',
           6=> '仕事ください',
           7=> '部屋探してます',
           8=> 'シェア仲間求む',
           9=> '旅行仲間求む',
           10=> 'シェアオフィス求む',
           11=> 'シェアオフィスあります'
  }
  def board_kind_list
    return @@kind
  end
  def get_kind_string(kind)
    return @@kind[kind]
  end
end
