class User < ApplicationRecord
    #F - find_by_credentials(class method)
    #I - is_password?
    #G - generate_session_token
    #V - validations
    #A - attr_reader for password 
    #P - password=
    #E - ensure_session_token
    #R - reset_session_token
    validates :username, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 
    validates :password, length:{minimum: 6, allow_nil: true}
    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username) #find_by is a method from ApplicationRecord
        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password) #this is_password is our own written method
        #variable_version
        bcrypt_password = BCrypt::Password.new(self.password_digest)
        bcrypt_password.is_password?(password) #this is_password? is from BCrypt
        #non - variable version
        # BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end
