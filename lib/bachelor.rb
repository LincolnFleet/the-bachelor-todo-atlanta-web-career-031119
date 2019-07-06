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
  res= data.reduce([]) do |acc, season|
    matches=season[1].select{|y| y['hometown']==hometown}
    acc+matches
  end
  res.length
end

def get_occupation(data, hometown)
  res= data.reduce([]) do |acc, season|
    matches=season[1].select{|y| y['hometown']==hometown}
    occs=matches.map{|z| z['occupation']}
    acc+occs
  end
  res.first
end

def get_average_age_for_season(data, season)
  cson=data.select{|k,v| k==season}
  yrs=cson.reduce([]) do |acc, per|
    acc+per[1].map{|x| x['age'].to_f}
  end
  debugger
  (yrs.reduce(0.0){|acc, dig| acc+dig} / yrs.length.to_f).round
end
