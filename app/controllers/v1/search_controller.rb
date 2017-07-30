module V1
  class SearchController < ApplicationController
    before_action :validate_params, only: [:index]

    def index
      suppliers = params[:suppliers].to_s.split(",")
      data = if suppliers.empty?
          Supplier.all
        else
          Supplier.find_by_names(suppliers)
        end.map do |s|
          s.fetch_from_url
        end.flatten
      render json: find_cheapest(data)
    end

    private

    def find_cheapest hotels
      {}.tap do |results|
        hotels.each do |h|
          next if results[h[:id]] && results[h[:id]][:price] < h[:price]
          results[h[:id]] = h
        end
      end.values
    end

    def validate_params
      params.require([:checkin, :checkout, :destination, :guest])
    end
  end
end
