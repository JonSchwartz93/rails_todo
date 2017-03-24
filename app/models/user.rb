class User < ActiveRecord::Base
	before_save :downcase_email
	has_secure_password
	has_many :lists
	validates :first_name, presence: true, length: { maximum: 20 }
	validates :last_name, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
					  format: { with: VALID_EMAIL_REGEX, message: "must be in email format, e.g. abc@xyz.com" }, 
					  uniqueness: { case_sensitive: false },
					  length: { maximum: 50 }
  	validates :password, presence: true, length: {minimum: 8 }

  	private

  	def downcase_email
  		self.email = email.downcase
  	end
end
