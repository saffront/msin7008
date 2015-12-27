class User < ActiveRecord::Base
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable
	  belongs_to :plan
	  has_one :profile
	  has_many :links
	  attr_accessor :stripe_card_token

	    has_attached_file :avatar, styles: {
   thumb: '100x100>',
   square: '200x200#',
   medium: '300x300>'}, :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/aws.yml",
    :bucket => "msin"

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	  def save_with_payment
	  	if valid?
	  	customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
	      self.stripe_customer_token = customer.id
	      save!
	  end
	end
end
