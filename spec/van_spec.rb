require 'van'
require 'bike'
require 'docking_station'

describe Van do

	let(:van) { Van.new }
	

	it 'should only accept broken bikes when it goes to the garage' do
		bike.break!
		expect(bike).to be_broken
	end

	it 'can collect broken bikes from a docking station' do
		# we need a station with broken bikes
		# we need a van, broken bike
		# when i collect the broken bikes from station, i have those bikes and the station doesn't

		broken_bike = double :bike, broken?: true
		station     = double :station, broken_bikes: [broken_bike]

		expect(station).to receive(:release).with(broken_bike).and_return(broken_bike)

		van.collect_broken_bikes_from(station)

		expect(van.unavailable_bikes).to eq [broken_bike]

	end


end