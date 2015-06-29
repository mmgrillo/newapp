require "rails_helper"

describe User do

  describe '#password_complexity' do

    context 'when no uppercase letter' do
      # The "context" sets up the environment/context in which the test "it" will run.
      # Usually this is done inside a "before do...end" block. In the "before" block we
      # prepare the environment and to be on the safe side we check (usually with a couple of
      # "expect"ations whether the context has been set up correctly)
      before do
        subject.email = "user@example.com"
        subject.password = "qwerty1234"

        expect(subject.password).to_not match(/[A-Z]/)
      end

      # The "it" is the real test. Inside that we usually break the test into 2 parts. The
      # FIRE part and the CHECK part. Sometimes, the framework (like RSpec, or Test Unit or RSpec with extenstions like shoulda)
      # allows us to implement the two parts in one step at the time.
      # The FIRE part executes the method that we are testing. The CHECK part tries to
      # check whether the results of the FIRE are the ones that they should be.
      it 'should not be valid ' do
        # fire
        subject.valid?

        # check that the test gives the result that we want
        expect(subject.errors[:password]).to include("must include at least one lowercase letter, one uppercase letter, and one digit")
      end
    end

    context 'when it has length less than 8' do
      before do
        subject.email = "user@example.com"
        subject.password ="abc"

        expect(subject.password.length).to be < 8
      end

      it 'should not be valid ' do
        # fire
        subject.valid?

        # check that the test gives the result that we want
        expect(subject.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end

  end
end



# require 'rails_helper'
#
#
# describe User do
# 	user = User.new(email: 'mail@mail.com', password: "1234567Cf")
#
#   it "is valid with a complex password" do
#     user.should be_valid
#   end
#
#   it "is not valid without a complex password" do
#     user.password = "12345678"
#     user.should_not be_valid
#   end
# end
#
#
# # describe User, '#password_complexity' do
#
# # describe  do
# #     context 'passwords must have eight characters plus one upper one lower case' do
# #       subject { build(:user) }
# #          it { should validate_length_of(:password).is_at_least(8) }
# #          it { should have_at_least("A-Z") }
# #          it { should have_at_least("a-z") }
# #     end
# #   end
# # end
#
#
# # describe User, "#password_complexity" do
# #   context 'passwords must have eight characters plus one upper one lower case' do
# #     user = User.new(email: "newuser@gmail.com", password: "12345")
# #     user.invalid?
#
# #      it 'should invalidate user password' do
# # 		   expect(user.errors[:password])
# #      end
# #   end
#
# #   context 'passwords must have eight characters plus one upper one lower case' do
# #     user = User.new(email: "newuser@gmail.com", password: "12345678Fc")
# #     user.valid?
#
# #     it "should allow user to be created" do
# #        expect(:user).to be_valid
# #     end
# #   end
# # end
#
#
#
#
