class Booking
  TARIFF = { per_minute: 2,
    hourly: 22,
    daily: 60,
    weekly: 105 }
  # if no duration is given, default to 0 minutes
  def get_price(duration = 0)
    # first work out the number of complete weeks:
    num_weeks = duration / 10080 
    price_for_weeks = num_weeks*TARIFF[:weekly]
  
    price = price_for_weeks 
  end
end