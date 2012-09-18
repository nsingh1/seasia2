class Invite < ActiveRecord::Base
  attr_accessible :mail, :name, :project_id, :user_id
  validates_uniqueness_of :project_id, :scope => :mail
  belongs_to :project
  belongs_to :user

mail_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  

  validates :user_id, :presence => true
  validates :project_id, :presence => true 

validates :mail, :presence => true,
                    :format   => { :with => mail_regex }



 
end
