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
    it 'calculates price for 9 days as 2 weeks' do 
      expect(booking.get_price(12960)).to eq 2*tariff[:weekly]
    end 
    it 'defaults to 0 if given no duration' do
      expect(booking.get_price()).to eq 0
    end
    it 'calculates price for 1 day' do
      expect(booking.get_price(1440)).to eq tariff[:daily]
    end
    it 'calculates price for 2 days as the weekly rate' do
      expect(booking.get_price(2880)).to eq tariff[:weekly]
    end
    it 'calculates price for 3 days as the weekly rate' do
      expect(booking.get_price(4320)).to eq tariff[:weekly]
    end
    it 'calculates price for 1 hour' do
      expect(booking.get_price(60)).to eq tariff[:hourly]
    end
    it 'calculates price for 2 hours' do
      expect(booking.get_price(120)).to eq 2*tariff[:hourly]
    end
    it 'calculates price for 3 hours as daily rate' do
      expect(booking.get_price(180)).to eq tariff[:daily]
    end
    it 'calculates price for 11 minutes' do
      expect(booking.get_price(11)).to eq 11*tariff[:per_minute]
    end
    it 'calculates price for 12 minutes as the hourly rate' do
      expect(booking.get_price(12)).to eq tariff[:hourly]
    end
    context '#when calculating combinations of rates' do 
      it 'calculates price for 70 minutes as 1hr + 10 min tariff' do
        expect(booking.get_price(70)).to eq tariff[:hourly] + 10*tariff[:per_minute]
      end
      it 'calculates price for 8 days' do 
        expect(booking.get_price(11520)).to eq tariff[:weekly] + tariff[:daily]
      end 
      it 'calculates price for 26 hours as daily rate + 2 times hourly rate' do 
        expect(booking.get_price(1560)).to eq tariff[:daily] + 2*tariff[:hourly]
      end 
    end

    context '#when given a different tariff' do 
      tariff_1 = { 
        per_minute: 2,
        hourly: 22,
        daily: 50, # this means 2 days more economical than 1 week 
        weekly: 105 
        }
      subject(:booking_with_different_tariff) { described_class.new(tariff_1) }
      
      it 'calculates price for 2 days as 2 days on tariff_1 because thats cheaper than weekly tariff' do
        p booking_with_different_tariff.get_price(2880)
        expect(booking_with_different_tariff.get_price(2880)).to eq 2*tariff_1[:daily]
      end
    end

  end
end