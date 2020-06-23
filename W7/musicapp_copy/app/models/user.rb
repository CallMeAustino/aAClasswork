class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true

    after_initialize :ensure_session_token
    attr_reader :password

    def self.find_by_credentials(email, password)
        @current_user = User.find_by(email: email)
        return nil unless @current_user.is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        password_bc = BCrypt::Password.new(self.password_digest)
        password_bc.is_password?(password)
    end


private

    def self.generate_session_token
        SecureRandom::urlsafe_base64(32)
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

end

#FIG_VAPER