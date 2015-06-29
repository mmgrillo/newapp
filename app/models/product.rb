class Product < ActiveRecord::Base
	validates :name, presence: true 
	validates :description, :image_url, :key, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates_uniqueness_of :name, case_sensitive: false
	validates :key, uniqueness: true
	validates :image_url, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
	has_many :orders
	has_many :comments

  def average_rating
  	comments.average(:rating).to_f
  end

end
