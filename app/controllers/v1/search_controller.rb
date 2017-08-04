module V1
  class SearchController < ApplicationController
    before_action :validate_params, :set_key, only: [:index]

    def index
      render json: find_cheapest(fetch_hotels_from_cache)
    end

    private
    def fetch_hotels_from_cache
      Rails.cache.fetch(@key, expires_in: Settings.cache.expires.hotel) do
        fetch_hotels params[:suppliers].to_s.split(",")
      end
    end

    def fetch_hotels suppliers = []
      suppliers = if suppliers.empty?
        Supplier.all
      else
        Supplier.find_by_names(suppliers)
      end
      Parallel.map(suppliers, in_threads: 5) do |s|
        s.fetch_from_url
      end.flatten
    end

    def find_cheapest hotels
      {}.tap do |results|
        hotels.each do |h|
          next if results[h[:id]] && results[h[:id]][:price] < h[:price]
          results[h[:id]] = h
        end
      end.values
    end

    def validate_params
      params.require([:checkin, :checkout, :destination, :guests])
    end

    def set_key
      key_base = {
        checkin: params[:checkin],
        checkout: params[:checkout],
        destination: params[:destination],
        guests: params[:guests],
        suppliers: params[:suppliers]
      }
      @key = Digest::MD5.hexdigest(key_base.to_s)
    end
  end
end
