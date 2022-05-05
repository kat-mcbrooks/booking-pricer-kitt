# Pricing Function Tech Test (Kitt)

**Ruby | RSpec**

Kitt is looking to add a pricing function to their meeting
room bookings feature, as they have noticed that this is being
requested more and more by companies.

## My task

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

#### Assumptions

I have made the following assumptions, which I would have clarified if given this task by a client in a real-world situation:

- The function should work out the cheapest possible rate combination i.e. 8 days would be the weekly tariff + daily tariff rather than 8* daily tariff or 2*weekly tariff. Please note that I have included these in the 'more complex example test cases'
- Duration is always provided as an integer, in line with the pseudocode parameter: '(duration_minutes as Integer)'

| Input                                 | Output                          | Notes               |
| ------------------------------------- | ------------------------------- | ------------------- |
| Meeting duration in minutes (integer) | Price of meeting room (integer) |
| 1440                                  | 60                              | (24hr / 1 day)      |
| 2880                                  | 105                             | (48hr / 2 days)     |
| 20160                                 | 210                             | (14 days / 2 weeks) |
| 180                                   | 60                              | (3hr)               |
| 10080                                 | 105                             | (1 week)            |
| 0                                     | 0                               |                     |

#### More complex example test cases i.e. when the cheapest rate is a combination of tariffs:

| Input | Output | Notes                                    |
| ----- | ------ | ---------------------------------------- |
| 11520 | 165    | (8 days -> weekly + 1\*daily rate)       |
| 70    | 42     | (70 minutes -> hourly + 10\*minute rate) |

### Instructions to run the program:

1. Clone this directory
2. Run bundle install to install the required dependencies
3. Run RSpec within the root directory to run tests and see test coverage
