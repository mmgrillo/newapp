class Product < ActiveRecord::Base
	validates :name, :description, :image_url, :key, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates_uniqueness_of :name, case_sensitive: false
	validates :key, uniqueness: true
	validates :image_url, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
end
