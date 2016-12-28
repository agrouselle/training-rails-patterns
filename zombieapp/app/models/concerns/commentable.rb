module Commentable
  # One way
  # def self.included(base)
  #   base.class_eval do
  #     has_many :comments, as: :commentable
  #   end
  # end

  # Another way
  # ActiveSupport::Concern was added in Rails 3 and provides utility methods for module mixins
  extend ActiveSupport::Concern

  included do
    # Executed in the context of the target class
    has_many :comments, as: :commentable
  end

  # Becomes an instance method of the target class
  def comments_by_user(id)
    comments.where(user_id: id)
  end

  # Methods declared inside of this inner module become class methods on the target class
  module ClassMethods
    def upvote(comment)
      # ...
    end
  end
end