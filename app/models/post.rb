class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  validates_presence_of :title, :content
  field :title, :type => String
  field :content, :type => String
  belongs_to :user
end
