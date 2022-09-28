class User < ApplicationRecord 
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password
    has_secure_password

    before_save :api_key
    
    def api_key
        self.api_key = SecureRandom.hex(16)
    end 
end 