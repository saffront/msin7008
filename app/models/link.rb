class Link < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments	
	scope :reverse_all, -> {order('created_at DESC')}
end
