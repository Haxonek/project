class Comment < ActiveRecord::Base
  belongs_to :chapter

  validates :chapter_id, :user_id, :body, presence: true
end
