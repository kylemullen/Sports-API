# module API
# 	module v1

class Api::V1::SportsController < ApplicationController
	# before_action :restrict_access

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
 	  @sport = Sport.new(sport_params)
	  if @sport.save
	  else
      render json: { errors: @sport.errors.full_messages }, status: 422
    end
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

	def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => api_key)
    end
  end

end
