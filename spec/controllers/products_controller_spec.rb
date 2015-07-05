require 'rails_helper'

describe "routing to products" do
  it "routes /products/new to products#new" do
    expect(get: "/products/new").to route_to(
      controller: "products",
      action: "new",
    )
  end

  it "routes /products/show to products#show" do
  	expect(get: "/products/1").to route_to(
  		controller: "products",
  		action: "show",
  		id: "1"
  		)
  end

  it "routes /products to products#create" do
  	expect(post: "/products").to route_to(
  		controller: "products",
  		action: "create",
  		)
  end

  it "routes /products/1 to products#destroy" do
  	expect(delete: "products/1").to route_to(
  		controller: "products",
  		action: "destroy",
  		id: "1"
  		)
  end
end

describe ProductsController, "create a new product" do

  describe "POST create" do
    it "should redirect to @product on succesful save" do
      subject { build(:product) }
      response.should redirect_to(@product)
    end
  end

    it "should render a new template on a failed save" do
       subject { build(:product) }
      response.should redirect_to(@product)
    end

end

