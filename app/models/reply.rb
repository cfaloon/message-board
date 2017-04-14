class Reply < ActiveRecord::Base
  # relations
  belongs_to :user
  belongs_to :post
  # validations
  validates :content, :user_id, :post_id, presence: true
end
