class Micropost < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :content,:photo
 
  has_many :floads, :dependent => :destroy
  has_many :comments, :dependent => :destroy
   validates :content,  :presence => true
  default_scope :order => 'microposts.created_at DESC'
after_save :store_photo

def has_photo?
File.exists? photo_filename
end

def photo=(file_data)
unless file_data.blank?
# store the uploaded data into a private instance variable
@file_data = file_data
# figure out the last part of the filename and use this as
# the file extension. e.g., from "me.jpg" will return "jpg"
self.extension = file_data.original_filename.split('.').last.downcase
end
end

# File.join is a cross-platform way of joining directories;
# we could have written "#{RAILS_ROOT}/public/photo_store"
MICROPOST_STORE = File.join Rails.root, 'public', 'micropost_store'
# where to write the image file to
def photo_filename
File.join MICROPOST_STORE, "#{id}.#{extension}"
end
# return a path we can use in HTML for the image
def photo_path
"/micropost_store/#{id}.#{extension}"
end


# if a photo file exists, then we have a photo




private
def store_photo
if @file_data
# make the photo_store directory if it doesn't exist already
FileUtils.mkdir_p MICROPOST_STORE
# write out the image data to the file
File.open(photo_filename, 'wb') do |f|
f.write(@file_data.read)
end
# ensure file saved only when it newly arrives at model being saved
@file_data = nil
end


end



end
