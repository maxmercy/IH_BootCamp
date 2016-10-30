module Time_check
  #return season = season name
   def season_check
      year_day = Date.today.yday().to_i
      year = Date.today.year.to_i
      is_leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
      if is_leap_year and year_day > 60
        # if is leap year and date > 28 february
        year_day = year_day - 1
      end
      if year_day >= 355 or year_day < 81
        season = :winter
      elsif year_day >= 81 and year_day < 173
        season = :spring
      elsif year_day >= 173 and year_day < 266
        season = :summer
      elsif year_day >= 266 and year_day < 355
       season = :autumn
      end
      return season
    end


end
