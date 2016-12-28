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

  # Bad example
  # This method will be used only in the show.html.erb view
  # It pollutes the model with view-related business logic
  # It's better to have it in a Decorator
  # def front_page?
  #   published_on > 2.days.ago
  # end

  # Bad example
  # Placing serialization logic in the model breaks the Single Responsibility Principle :
  # This model is now responsible for persisting and validating, but also for formatting
  # to custom JSON
  # def as_json(params={})
  #   super(except: [:created_at, :updated_at], include: {comments: {only: :id}})
  # end

  # Defines a custom serializer for this model
  def active_model_serializer
    CustomItemSerializer
  end
end
