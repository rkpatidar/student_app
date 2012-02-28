class Student < ActiveRecord::Base

  has_many:issuedbook,:dependent => :destroy


  validates_uniqueness_of :user,:email
  validates_presence_of :user, :password, :role, :first_name, :last_name, :address, :college
  validates_size_of :user, :password, :within => 5..15
  validates_format_of :address,:college, :with => /^\w+$/i,
  :message => "can only contain letters and numbers."
  validates_format_of :first_name,:last_name,:with => /^[-a-z]+$/,
  :message=> "first name and last name must be alphabet only "

  
  def self.check_password(username,password)
    #self.where("user = ? AND password = ?",username,password)
    Student.find(:first, :conditions => ["user=? And password=?",username,password])
  end
  
  def is_admin?
    self.role == "a" ? true : false
  end
  
  def is_librarian?
    self.role=="l" ? true : false
  end
  
  def is_user?
    self.role == "u" ? true : false
  end
end
