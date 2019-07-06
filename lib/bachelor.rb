require 'byebug'

def get_first_name_of_season_winner(data, season)
  winner = data[season].map do |item|
    if item['status'] == 'Winner'
      x=item['name'].split(' ')
      return x[0]
    else
    end
  end
  return winner||'Season has not concluded'
end

def get_contestant_name(data, occupation)
  res= data.reduce([]) do |acc, season|
    matches=season[1].select{|y| y['occupation']==occupation}
    names=matches.map{|z| z['name']}
    acc+names
  end
  res.join(',')
end

def count_contestants_by_hometown(data, hometown)
  # code here
end

def get_occupation(data, hometown)
  # code here
end

def get_average_age_for_season(data, season)
  # code here
end
