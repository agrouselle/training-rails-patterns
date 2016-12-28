class Item < ActiveRecord::Base
  belongs_to :user

  def publish
    # Guard clause
    return false if !is_approved? || user.admin?

    self.published_on = Time.now
    self.save
  end
end
