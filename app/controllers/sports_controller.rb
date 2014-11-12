class SportsController < ApplicationController
	respond_to :xml, :json, :html

	def show
	  @sport = Sport.find_by(:id => params[:id])
	  #respond_with(@sport)
	 end

	def index
	  @sports = Sport.all
	  # respond_with(@sports)
	 end

	def create
 	  @sport = Sport.create(sport_params)
	  respond_with(@sport)
	end

	def destroy
	  @sport = Sport.find_by(:id => params[:id])
	  @sport.destroy
	  # respond_with(@sport)
	end

	def update
	  @sport = Sport.find_by(:id => params[:id])
	  @sport.update(sport_params)
	  respond_with(@sport)
	end

	private

	def sport_params
		return params.require(:sport).permit(:name, :description, :players, :court, :created_in)
	end

end
