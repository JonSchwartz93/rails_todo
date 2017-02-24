class User < ActiveRecord::Base
	has_secure_password
	# has_many :lists, foreign_key: "creator_id"
	validates :email, presence: true, uniqueness: true
	validates :email, format: {with: /\A.+@.+\..+\z/, message: "must be in email format, e.g. abc@xyz.com"}
  	# validates :password, length: {minimum: 8}
end
