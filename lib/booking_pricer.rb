# minutes conversion:
# 1 week == 10080 minutes
# 1 day == 1440 minutes
# 1 hour == 60 minutes 

class Booking
  TARIFF = { per_minute: 2,
    hourly: 22,
    daily: 60,
    weekly: 105 }
  def initialize(tariff = TARIFF)
    @tariff = tariff
  end
  # if no duration is given, default to 0 minutes
  def get_price(duration = 0)
    # first work out the number of complete weeks
    whole_weeks = duration / 10080 
    price_for_weeks = whole_weeks*@tariff[:weekly]
    # then work out the number of days that don't make up a complete week
    days_remaining = duration % 10080 
    whole_days = days_remaining / 1440 
    price_for_days = [@tariff[:weekly], whole_days*@tariff[:daily]].min
    # then work out the number of hours that don't make up a complete day
    hours_remaining = days_remaining % 1440 # total duration in mins for any value < 1440
    whole_hours = hours_remaining / 60
    price_for_hours = [@tariff[:daily], whole_hours*@tariff[:hourly]].min
    # then work out the number of mins that don't make up a complete hour
    whole_mins = hours_remaining % 60
    price_for_minutes = [@tariff[:hourly], whole_mins*@tariff[:per_minute]].min

    price = price_for_weeks + price_for_days + price_for_hours + price_for_minutes 
  end
  
end