require 'roo'
xlsx = Roo::Excelx.new("xlsx/artists.xlsx")  
input= xlsx.parse(artist: 'artist', academic_ability: 'academic_ability', be_awarded: 'be_awarded', 
                  private_exhibition: 'private_exhibition', team_exhibition: 'team_exhibition', 
                  artfair: 'artfair',
                  possession: 'possession', introduce: 'introduce')
                    



input.each_with_index do |item, index| #첫번째 rzow는 칼럼이름으로 제외하기 위함
  next if index == 0
  #Professor.create(item)
  puts item
end 