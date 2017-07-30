require "rails_helper"

RSpec.describe "search API", :type => :request do

  let(:invalid_params) do
    {
      checkin: "20170701",
      checkout: "20170704",
      destination: "",
      guests: "2"
    }
  end
  let(:valid_params) do
    {
      checkin: "20170701",
      checkout: "20170704",
      destination: "Singapore",
      guests: "2",
      suppliers: "suppliers1"
    }
  end

  describe "return 400 without required params" do
    context "when all required params are missing" do
      it do
        get "/v1/search"
        expect(response.status).to eq 400
      end
    end
    context "when some of required params are missing" do
      it do
        get "/v1/search", params: invalid_params
        expect(response.status).to eq 400
      end
    end
  end

  it "does return 200 when all required params are present" do
    get "/v1/search", params: valid_params
    body = JSON.parse(response.body)
    expect(body).to eq []
    expect(response.status).to eq 200
  end

  it "does return 404 when endpoint isn't correct" do
    get "/v2/search"
    expect(response.status).to eq 404
  end
end
