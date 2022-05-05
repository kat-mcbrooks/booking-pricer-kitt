class Booking
  TARIFF = { per_minute: 2,
    hourly: 22,
    daily: 60,
    weekly: 105 }
  # if no duration is given, default to 0 minutes
  def get_price(duration = 0)
    # first work out the number of complete weeks:
    whole_weeks = duration / 10080 
    price_for_weeks = whole_weeks*TARIFF[:weekly]
    # work out the number of days that don't make up a complete week
    days_remaining = duration % 10080 
    whole_days = days_remaining / 1440 
    price_for_days = [TARIFF[:weekly], whole_days*TARIFF[:daily]].min
    # work out the number of hours that don't make up a complete day
    hours_remaining = days_remaining % 1440 # total duration in mins for any value < 1440
    whole_hours = hours_remaining / 60
    price_for_hours = [TARIFF[:daily], whole_hours*TARIFF[:hourly]].min

    price = price_for_weeks + price_for_days + price_for_hours
  end
end