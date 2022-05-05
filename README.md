# Pricing Function Tech Test (Kitt)

**Ruby | RSpec**

Kitt is looking to add a pricing function to their meeting
room bookings feature, as they have noticed that this is being
requested more and more by companies.

### My task

Create a function that takes a booking length in minutes
and returns a price. As always, and per the instructions, I will consider readability, performance, tests, safety and a robust system built with future engineers in mind.
Deadline: 3 days i.e. 6th May 10am

The intended functionality of the service is to calculate the price of a
meeting room based upon the given meeting duration and following
[min|hour|day|week] tariff:
Price per minute: £2
Price per hour: £22
Price per day: £60
Price per week: £105
Pseudocode interface:
GetPrice(duration_minutes as Integer) returns price as Integer

- The pricing function should use the cheapest rate for given
  duration.
- For example if the duration is 3 hours it should use the daily price
  of £60 as this is cheaper than using the price per hour (£66).

### My Approach

I opted to use a class for Booking and one function, get_price, that calculates the price. This is partly because I am working in Ruby, an OOP language, but also because I felt it would make the code more flexible and maintainable for future engineers.

Although currently we only have one tariff, by injecting the tariff on initialisation, the code allows flexibility for different tariffs to be used - if Kitt wanted to expand its system with multiple tariffs in the future.

One might also consider having a Tariff class, and inject an instance of the Tariff class into the Booking class on initialisation. I considered creating the Tariff class, but decided for the purpose of this task, it was sufficient to keep it as a constant.

| Input                                 | Output                          | Notes                                    |
| ------------------------------------- | ------------------------------- | ---------------------------------------- |
| Meeting duration in minutes (integer) | Price of meeting room (integer) |
| 1440                                  | 60                              | (24hr / 1 day)                           |
| 2880                                  | 105                             | (48hr / 2 days)                          |
| 20160                                 | 210                             | (14 days / 2 weeks)                      |
| 180                                   | 60                              | (3hr)                                    |
| 10080                                 | 105                             | (1 week)                                 |
| 0                                     | 0                               |                                          |
| 11520                                 | 165                             | (8 days -> weekly + 1\*daily rate)       |
| 70                                    | 42                              | (70 minutes -> hourly + 10\*minute rate) |

### Instructions to run the program:

1. Clone this directory
2. Run bundle install to install the required dependencies
3. Run RSpec within the root directory to run tests and see test coverage
4. Manually feature test the program by loading the file into the irb:

```
$ irb -r ./lib/booking_pricer.rb
3.1.1 :001 > booking_1 = Booking.new()
 => #<Booking:0x00007fe43cdf00c0 @tariff={:per_minute=>2, :hourly=>22, :daily=>60, :weekly=>105}>
3.1.1 :002 > price_for_2_days = booking_1.get_price(2880)
 => 105
3.1.1 :003 > price_for_3hours = booking_1.get_price(180)
 => 60

```

### Assumptions

I have made the following assumptions, which I would have clarified if given this task by a client in a real-world situation:

- The function should work out the cheapest possible rate combination i.e. 8 days would be the weekly tariff + daily tariff rather than 8* daily tariff or 2*weekly tariff.
- Duration is always provided as an integer, in line with the pseudocode parameter: '(duration_minutes as Integer)'. Similarly, the return value should be an integer, i.e. no £ sign is needed in the output. (By having the output as an integer, it is likely to mean the function could be integrated more easily with other functions in the system)
