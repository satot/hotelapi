require "rails_helper"

RSpec.describe Supplier, :type => :model do
  describe "find_by_names" do
    let(:supplier1){FactoryGirl.create :supplier}
    let(:supplier2){FactoryGirl.create :supplier}
    context "when a single name is given" do
      let(:suppliers){Supplier.find_by_names [supplier1.name]}
      it{expect(suppliers).to match_array [supplier1]}
    end

    context "when multiple names are given" do
      let(:suppliers){Supplier.find_by_names [supplier1.name, supplier2.name]}
      it{expect(suppliers).to match_array [supplier1, supplier2]}
    end

    context "when no name is given" do
      let(:suppliers){Supplier.find_by_names []}
      it{expect(suppliers).to match_array []}
    end
  end
end
