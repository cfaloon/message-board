class Post < ActiveRecord::Base
  # relations
  belongs_to :user
  has_many :replies
  #validations
  validates :title, :content, :user_id, presence: true
end
