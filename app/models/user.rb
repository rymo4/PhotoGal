class User < ActiveRecord::Base
  
  attr_accessible :first_name, :last_name :email, :class, :college_id, , :password, :password_confirmation
  validates :first_name, :presence => true, :length   => { :maximum => 30 }
  validates :last_name, :presence => true, :length   => { :maximum => 30 }
  validates :email, :presence => true,
                      :format     => { :with => email_regex },
                      :uniqueness => true
  validates :class, :presence => true
  validates :college_id, :presence => true
  validates :password, :presence     => true,
                         :confirmation => true,
                         :length       => { :within => 6..40 }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  
  
  before_save :encrypt_password

  private

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end
  
end
