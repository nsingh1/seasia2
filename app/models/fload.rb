class Fload < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :project
  belongs_to :user
  attr_accessible :data
validates :user_id, :presence => true
  validates :project_id, :presence => true  



after_save :store_data


def has_data?
File.exists? photo_filename
end

def data=(file_data)
unless file_data.blank?

@file_data = file_data

self.extension = file_data.original_filename.split('.').last.downcase
end
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



 def store_data
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

end
