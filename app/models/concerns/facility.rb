module Facilities

  def listOfHouse
    houseFacilities = { 0=>'浴槽',
                        1=>'シャワー',
                        2=>'トイレ',
                        3=>'キッチン',
                        4=>'冷蔵庫',
                        5=>'電子レンジ',
                        6=>'炊飯器',
                        7=>'自転車駐輪場',
                        8=>'駐車場有り',
                        9=>'バイク駐輪場',
                        10=>'洗濯機',
                        11=>'オートロック',
                        12=>'住民票登録可',
                        13=>'ペット可',
                        14=>'リビング',
                        15=>'庭',
                        16=>'掃除機'}
    return houseFacilities			
  end

  def listOfRoom
    roomFaciliteis = {0=>'インターネット',
                      1=>'エアコン' , 
                      2=>'喫煙可',
                      3=>'テレビ',
                      4=>'衛星放送・CATV',
                      5=>'ベッド・布団',
                      6=>'机・椅子',
                      7=>'楽器可',
                      8=>'二人入居可',
                      9=>'居住者以外宿泊'
    }
    return roomFaciliteis
  end

  def array_to_value(array)
    value=0
    if array.nil? then
      return value
    else
      for val in array do
        value = value + 2**val.to_i
      end
      return value
    end
  end

  def value_to_array(value)
    array= Array.new()
    if value.nil? then
      return array
    else
      str = value.to_s(2).reverse
      for i in 0..str.length
        if value[i] == 1 then
          array.push(i)
        end	
      end
      return array
    end
  end
end
