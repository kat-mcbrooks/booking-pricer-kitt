require 'booking_pricer'

describe Booking do 
 
  tariff = Booking::TARIFF
  subject(:booking) { described_class.new() }
  describe '#get_price' do
    it 'calculates price for 1 week' do
      expect(booking.get_price(10080)).to eq tariff[:weekly]
    end
    it 'calculates price for 2 weeks' do
      expect(booking.get_price(20160)).to eq 2*tariff[:weekly]
    end
    it 'defaults to 0 if given no duration' do
      expect(booking.get_price()).to eq 0
    end
    it 'calculates price for 1 day' do
      expect(booking.get_price(1440)).to eq tariff[:daily]
    end
    it 'calculates price for 2 days' do
      expect(booking.get_price(2880)).to eq tariff[:weekly]
    end
    it 'calculates price for 3 days' do
      expect(booking.get_price(4320)).to eq tariff[:weekly]
    end
  end
end