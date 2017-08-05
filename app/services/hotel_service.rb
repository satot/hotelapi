class HotelService

  def initialize params
    @checkin = params[:checkin]
    @checkout = params[:checkout]
    @destination = params[:destination]
    @guests = params[:guests]
    @suppliers = params[:suppliers].to_s.split(",")
  end

  def find_cheapest
    hotels = fetch_hotels_from_cache
    {}.tap do |results|
      hotels.each do |h|
        next if results[h[:id]] && results[h[:id]][:price] < h[:price]
        results[h[:id]] = h
      end
    end.values
  end

  private
  attr_reader :checkin, :checkout, :destination, :guests, :suppliers

  def fetch_hotels_from_cache
    Rails.cache.fetch(cache_key, expires_in: Settings.cache.expires.hotel) do
      fetch_hotels suppliers
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

  def cache_key
    key_base = {
      checkin: checkin,
      checkout: checkout,
      destination: destination,
      guests: guests,
      suppliers: suppliers.join(",")
    }
    Digest::MD5.hexdigest(key_base.to_s)
  end
end
