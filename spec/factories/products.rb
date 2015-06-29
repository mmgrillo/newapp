FactoryGirl.define do
	factory :product do
    name { SecureRandom.hex }
    description { SecureRandom.hex }
    image_url { "#{SecureRandom.hex}.jpg" }
    key { SecureRandom.hex }
    price 10 
  end		
end