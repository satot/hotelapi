require "rails_helper"

RSpec.describe SuppliersController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      supplier1 = Supplier.create!(name: "sp", url: "http://example.com")
      get :index
      expect(assigns(:suppliers)).to match_array [supplier1]
    end
  end
end
