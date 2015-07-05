require 'rails_helper'

describe ProductsController do
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

  describe '#create' do
    context 'when user is logged in' do
      before do
        user = create :user
        sign_in user
      end

      context 'when all data are provided' do
        before do
          @product_params = {
              name: 'Product name',
              description: 'Product desc',
              image_url: "/images/product.jpg",
              key: SecureRandom.hex,
              price: 10
          }
        end

        it 'creates a product' do
          expect do

            post :create, product: @product_params

          end.to change { Product.count }.by(1)
        end

        it 'redirects to product page' do
          post :create, product: @product_params

          @product = Product.last

          expect(response).to redirect_to(product_path(@product))
        end

        it 'creates product with correct data' do
          post :create, product: @product_params

          @product = Product.last

          expect(@product.name).to        eq(@product_params[:name])
          expect(@product.description).to eq(@product_params[:description])
          expect(@product.image_url).to   eq(@product_params[:image_url])
          expect(@product.key).to         eq(@product_params[:key])
          expect(@product.price).to       eq(@product_params[:price])
        end
      end
    end
  end
end