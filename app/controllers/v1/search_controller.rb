module V1
  class SearchController < ApplicationController
    before_action :validate_params, only: [:index]

    def index
      render json: HotelService.new(params).find_cheapest
    end

    private
    def validate_params
      params.require([:checkin, :checkout, :destination, :guests])
    end
  end
end
