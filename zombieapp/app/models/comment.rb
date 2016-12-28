class Comment < ActiveRecord::Base
  belongs_to :item

  scope :approved, ->{ where(approved: true) }
end
