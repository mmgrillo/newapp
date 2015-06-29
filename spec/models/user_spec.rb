require 'rails_helper'


describe User do
	user = User.new(email: 'mail@mail.com', password: "1234567Cf")

  it "is valid with a complex password" do
    user.should be_valid
  end

  it "is not valid without a complex password" do
    user.password = "12345678"
    user.should_not be_valid
  end
end


# describe User, '#password_complexity' do

# describe  do
#     context 'passwords must have eight characters plus one upper one lower case' do
#       subject { build(:user) }
#          it { should validate_length_of(:password).is_at_least(8) }
#          it { should have_at_least("A-Z") }
#          it { should have_at_least("a-z") }
#     end
#   end      	
# end


# describe User, "#password_complexity" do
#   context 'passwords must have eight characters plus one upper one lower case' do
#     user = User.new(email: "newuser@gmail.com", password: "12345")
#     user.invalid?

#      it 'should invalidate user password' do
# 		   expect(user.errors[:password])
#      end 
#   end

#   context 'passwords must have eight characters plus one upper one lower case' do
#     user = User.new(email: "newuser@gmail.com", password: "12345678Fc")
#     user.valid?

#     it "should allow user to be created" do
#        expect(:user).to be_valid
#     end
#   end
# end




