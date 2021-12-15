require 'rspec'
require_relative 'Package.rb'

describe Package do
    package = Package.new(2,4,3,2,"moscow","khabarovsk")
    it "should return place coords" do
        expect(package.getCoords("moscow")[0]).to eq(37.61778)
    end
    it "should return distance float" do
        expect(package.calculateDisnance).to be_an_instance_of(Float)
    end
    it "should return price float" do
        expect(package.calculatePrice).to be_an_instance_of(Float)
    end
    it "should return hash" do 
        expect(package.hash).to be_an_instance_of(Hash)
     end
end