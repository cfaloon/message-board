class Post < ActiveRecord::Base
  # relations
  belongs_to :user
  #validations
  validates :title, :content, presence: true
end
