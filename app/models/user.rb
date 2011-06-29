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

  def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
  end
  def self.authenticate(email, submitted_password)
     user = find_by_email(email)
     return nil  if user.nil?
     return user if user.has_password?(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
