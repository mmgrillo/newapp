require 'rails_helper'

  describe Product do 

  context "has a name" do
  	before { @product = Product.new(name: "Angus Beef") }

  	it "should return name" do
  	  expect(@product.name).to eq "Angus Beef"
  	end
  end

  context "has a price" do 
    before { @product = Product.new(price: 20.0) }

    it "should return price only" do
      expect(@product.price).to eq 20.0
    end
  end

  #validates uniqueness
  before do
  	@product = Product.new(name: "Carrot")
  end

  describe "when product name is already taken" do
  	before do
  		another_product = @product.dup
  		another_product.save
  	end

  	subject {@product}
  	it {should_not be_valid}
  	end
end