class Post < ActiveRecord::Base
  # relations
  belongs_to :user
  #validations
  validates :title, :content, :user_id, presence: true
end
