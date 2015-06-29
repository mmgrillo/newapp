FactoryGirl.define do
  factory :comment do
  	rating 5
  	body { SecureRandom.hex }
  	association :user
  end	
end	