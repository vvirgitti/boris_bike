require_relative 'bike_container'

class Garage
	
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept(bike)
		bike.fix!
		dock(bike)
	end

	def permission
		@van = true
	end





