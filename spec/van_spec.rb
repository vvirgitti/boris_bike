require 'van'
require 'bike'
require 'docking_station'

describe Van do

	let(:van) { Van.new }
	let(:broken_bike) {double :bike, broken?: true}
	

	it 'can collect broken bikes from a docking station' do
		# we need a station with broken bikes
		# we need a van, broken bike
		# when i collect the broken bikes from station, i have those bikes and the station doesn't

		station     = double :station, broken_bikes: [broken_bike]

		expect(station).to receive(:release).with(broken_bike).and_return(broken_bike)

		van.collect_broken_bikes_from(station)

		expect(van.unavailable_bikes).to eq [broken_bike]
	end


	it 'can deliver broken bikes to the garage' do 
		# we need a van with broken bikes
		# we need a garage, broken bikes
		# when I deliver the broken bikes to the garage, the garage have them and I don't

		van = double :van, broken_bikes: [broken_bike]

		expect(van).to receive(:release).with(broken_bike).and_return(broken_bike)

	end
	

end