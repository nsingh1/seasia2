class User < ActiveRecord::Base
 attr_accessible :name,:email, :password, :password_confirmation, :photo,:auth_token, :verify
 has_secure_password
after_save :store_photo


email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
			:uniqueness => {:case_sensitive => false}
validates_presence_of :password,:on => :create, :message => "should not contain blank spaces at the start and end of the password"
validates_length_of :password, :minimum => 6,:maximum => 20, :allow_blank => true, :with => /^[-\w\._@]+$/i
validates_confirmation_of :password, :message => " "
has_many :projects, :dependent => :destroy
has_many :microposts, :dependent => :destroy
has_many :floads, :dependent => :destroy
has_many :comments, :dependent => :destroy
validates_format_of :extension, :with => /^[\.(png|jpg|jpeg|gif)]+$/i,:allow_blank => true, :message => "onlypng or jpg or jpeg or gif"
before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def verify_user
  generate_token(:verify_token)
  self.verify_sent_at = Time.zone.now
  save!
  UserMailer.verify_token(self).deliver
end
def generate_token(column)
  begin
    self[column] = SecureRandom.base64.tr("+/", "-_")
  end while User.exists?(column => self[column])
end

def has_photo?
File.exists? photo_filename
end

# when photo data is assigned via the upload, store the file data
# for later and assign the file extension, e.g., ".jpg"
def photo=(file_data)
unless file_data.blank?
# store the uploaded data into a private instance variable
@file_data = file_data
# figure out the last part of the filename and use this as
# the file extension. e.g., from "me.jpg" will return "jpg"
self.extension = file_data.original_filename.split('.').last.downcase
@ext=self.extension
end
end
def to_param
    name
  end
# File.join is a cross-platform way of joining directories;
# we could have written "#{RAILS_ROOT}/public/photo_store"
PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'
# where to write the image file to
  def photo_filename
	File.join PHOTO_STORE, "#{id}.#{extension}"
   end
# return a path we can use in HTML for the image
def photo_path
"/photo_store/#{id}.#{extension}"
end


 

  def store_photo
	if @file_data
	# make the photo_store directory if it doesn't exist already
	FileUtils.mkdir_p PHOTO_STORE
	# write out the image data to the file
	File.open(photo_filename, 'wb') do |f|
		f.write(@file_data.read)
	end
	# ensure file saved only when it newly arrives at model being saved
	@file_data = nil
  end
end

def check_photo
 if  (@ext == "png" || @ext == "jpg") || (@ext == "jpeg" || @ext == "gif")
    return true;
 else
    return false; 
 end
end


  def strip_whitespace
    self.password = self.password.strip
 
  end

end
