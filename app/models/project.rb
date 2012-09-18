class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :project_name, :company_name, :data
validates_uniqueness_of :project_name, :scope => :company_name, :message => "Project with same Company name already exist"
has_many :invites, :dependent => :destroy
has_many :floads, :dependent => :destroy
has_many :microposts, :dependent => :destroy
has_many :comments, :dependent => :destroy

validates :company_name,:presence => true,
                    :length   => { :maximum => 23 }
validates :project_name,:presence => true,
                    :length   => { :maximum => 18 }

  def to_param
    project_name
  end

end
