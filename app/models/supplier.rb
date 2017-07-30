require 'open-uri'
class Supplier < ApplicationRecord
  def fetch_from_url
    data = URI.parse(url).read
    JSON.parse(data).map do |id, price|
      {id: id, price: price, supplier: name}
    end
  end

  class << self
    def find_by_names name_arr
      where(name: name_arr)
    end
  end
end
