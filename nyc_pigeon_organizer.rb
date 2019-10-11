def assign_gender(m, f)
  males = {}
  m.each { |name|
    males[name] = {:gender => "male"}
  }
  
  females = {}
  f.each { |name| 
    females[name] = {:gender => "female"}
  }
  
  males.merge(females)
end

def assign_colors(new_hash, data)
  
  new_hash.each { |name, val|
    colors = data[:color].keys
    
    colors.each { |color|
      coll_color = []
      if data[:color][color].include?(name)
        coll_color.push(color.to_s)
        new_hash[name] = {
          :color => coll_color,
          :gender => val[:gender]
        }
      end
    }
  }

  new_hash
end

def assign_lives(new_hash, data)
  new_hash.each { |name, val|
    locations = data[:lives].keys

    locations.each { |location|
      coll_lives = []
      if data[:lives][location].include?(name)
        coll_lives.push(location)
        new_hash[name] = {
          :color => val[:color],
          :gender => val[:gender],
          :lives => coll_lives
        }
      end
    }
  }
  
  new_hash
end

def nyc_pigeon_organizer(data)
  males = data[:gender][:male]
  females = data[:gender][:female]
  data_gender = assign_gender(males, females)
  data_colors = assign_colors(data_gender, data)
  final_data = assign_lives(data_colors, data)
  final_data
end
