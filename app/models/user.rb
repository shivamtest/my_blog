class User < ActiveRecord::Base
  include BCrypt

  has_many :posts
  validates :name, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
  # validates :email, format: { with: VALID_EMAIL_REGEX }
  #need length validation.


  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # def create
  #   @user = User.new(params[:user])
  #   @user.password = params[:password]
  #   @user.save!
  # end

  def self.login(email, password)
    user = User.find_by_email(email)
    user && (BCrypt::Password.new(user.password_hash) == password)
  end

end
