class User < ActiveRecord::Base
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  columbia_regex = /\A(([a-zA-Z]{2,3})(\d{4})@columbia.edu)/i
  
  attr_accessor :password
  
  attr_accessible :first_name, :last_name, :email, :college_id , :password, :password_confirmation, :year, :school_id, :dorm_id
  
  has_many :photos, :dependent => :destroy
  
  
  has_many :comments, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                             :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                     :class_name => "Relationship",
                                     :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower     
  has_many :favorites                    
  belongs_to :college
  belongs_to :dorm
  belongs_to :school
  
  validates :first_name, :presence => true, :length   => { :maximum => 30 }
  validates :last_name, :presence => true, 
                        :length   => { :maximum => 30 }
  validates :email, :presence => true,
                    :format     => { :with => columbia_regex, :message => "is not a college email address" },
                    :uniqueness => true
  validates :college_id, :presence => true
  validates :dorm_id, :presence => true
  validates :year, :presence => true
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
  
  before_save :encrypt_password
  before_save :downcase_email
  
  def downcase_email
    self.email.downcase!
  end

  def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
  end
      
  def self.authenticate(email, submitted_password)
      user = find_by_email(email)
      return nil  if user.nil?
      return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
  end
  
  def following?(followed)
      relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
      relationships.find_by_followed_id(followed).destroy
  end
  
  def feed
     Photo.from_users_followed_by(self)
  end
  
  
  def favoriting?(photo)
      favorites.find_by_photo_id(photo)
  end

  def favorite!(photo)
    favorites.create!(:photo_id => photo.id)
  end
  
  def unfavorite!(photo)
      favorites.find_by_photo_id(photo).destroy
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
