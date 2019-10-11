
def nyc_pigeon_organizer(data)
  males = data[:gender][:male]
  females = data[:gender][:female]
  names = males.concat(females)

  new_hash = {}
  for name in names
    colors = data[:color].keys
    genders = data[:gender].keys
    lives = data[:lives].keys
    
    arr_colors = []
    arr_gender = []
    arr_lives =[]

    colors.each { |color|
      if data[:color][color].include?(name)
        arr_colors.push(color.to_s)
      end
    }
    
    genders.each { |gender|
      if data[:gender][gender].include?(name)
        arr_gender = [gender.to_s]
      end
    }

    lives.each { |live|
      if data[:lives][live].include?(name)
        arr_lives.push(live.to_s)
      end
    }

    new_hash[name] = {
      :color => arr_colors,
      :gender => arr_gender,
      :lives => arr_lives
    }
    
  end

  new_hash
end
