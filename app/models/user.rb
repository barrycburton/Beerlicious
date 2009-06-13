require 'digest/sha1'

class User < ActiveRecord::Base
  @password
  
  validates_length_of :name, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_presence_of :name, :password, :password_confirmation, :salt
  validates_uniqueness_of :name
  validates_confirmation_of :password
  
  attr_protected :id, :salt
  
  attr_accessor :password, :password_confirmation
 
 
  def password=(pass)
    @password=pass
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end
  
  def self.authenticate(name, pass)
    u=find(:first, :conditions=>["name = ?", name])
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt)==u.hashed_password
    nil
  end


protected
  
  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    prsg = ""
    1.upto(len) { |i| prsg << chars[rand(chars.size-1)] }
    return prsg
  end
  
  def self.encrypt(pass, salt)
     Digest::SHA1.hexdigest(pass+salt)
  end

end
