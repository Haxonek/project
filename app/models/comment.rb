class Comment < ActiveRecord::Base
  belongs_to :chapter, :user

  validates :chapter_id, :user_id, :body, presence: true
end
