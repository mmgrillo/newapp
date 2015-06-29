FactoryGirl.define do
  factory :user do
  	email { "#{SecureRandom.hex}@mailinator.com" }
  	password "1234567aE"
  end	
end
