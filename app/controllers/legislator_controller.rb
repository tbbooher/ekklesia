class LegislatorController < ApplicationController

	def show
		@legislator = Legislator.find(@id)
	end

end