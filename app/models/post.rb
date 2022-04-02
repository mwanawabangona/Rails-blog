class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  has_many :likes
  has_many :comments

  after_create :update_posts_counter

  after_destroy :update_posts_counter_after_destroy

  def update_posts_counter
    author.increment!(:Posts_Counter)
  end

  def update_posts_counter_after_destroy
    author.decrement!(:Posts_Counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
