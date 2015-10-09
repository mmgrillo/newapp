class Order < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	after_create :send_confirmation_email

	private

	def send_confirmation_email
		UserMailer.send_order_confirmation_email(id).deliver
	end	
end