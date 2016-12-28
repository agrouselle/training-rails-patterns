class Item < ActiveRecord::Base
  include Commentable

  belongs_to :user


  scope :published, ->{ where('published = ? AND published_on > ?', true, 2.days.ago) }
  scope :by_user, ->(user) { where(user: user) if user.present? }

  # Use merge to combine conditions from different models
  scope :with_approved_comments, ->{ joins(:comments).merge(Comment.approved) }


  def publish
    # Guard clause
    return false if !is_approved? || user.admin?

    self.published_on = Time.now
    self.save
  end
end
